if [ -d $HOME/farcaster ] ; then

 echo "There is farcaster. Trying to update..."
 cd /root/farcaster/apps/hubble/
 
 # Останавливаем ноду
 echo "Stopping docker containers..." && docker compose stop
 sleep 5

 # Проверяем остановилась ли нода
 ## Выполнение команды docker compose ps и сохранение вывода в переменную
 output=$(docker compose ps)

 ## Проверяем, содержит ли вывод только заголовок docker compose ps
 if [ "$(echo "$output" | wc -l)" -eq 1 ]; then
 
 ### Действия если нода остановлена
 
 #### Обновляем ветку из Git
 echo "Making git checkout main && git pull..." && git checkout main && git pull
 
 #### Запускаем ноду
 echo "Starting docker containers..." && docker compose up -d --force-recreate --pull always
 sleep 10
  
 #### Проверяем статус ноды *******************************************
  echo "Checking the node's status..."
  # Объявляем функцию проверки состояния контейнеров
  check_container() {
   local container_name=$1
   local status=$(docker inspect -f '{{.State.Status}}' "$container_name" 2>/dev/null)

   if [ "$status" == "running" ]; then
    return 0
   else
    return 1
   fi
  }

  # Создаем список контейнеров для проверки
  containers=("hubble-grafana-1" "hubble-hubble-1" "hubble-statsd-1")

  all_running=true

  # Цикл проверки контейнеров
  for container in "${containers[@]}"; do
   if ! check_container "$container"; then
    all_running=false
    break
   fi
  done

  if $all_running; then
   # Действия, если контейнеры запущены
   echo "Node successfully updated and started!"
   docker compose ps
   echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true
  else
   # Действия, если не все контейнеры запущены
   echo "ERROR! Node updated, but not all node's containers are running!"
   docker compose ps
  fi
  # *******************************************

 else
  ### Действия, если какие-то контейнеры все еще работают
  echo "ERROR: some node's parts is not stopped, exit without any changes"
  docker compose ps  
 fi 
 
else

 echo "There is no farcaster, nothong to do."

fi
