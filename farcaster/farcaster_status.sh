# Статус и журналы

if [ -d $HOME/farcaster ] ; then

 echo "There is farcaster. Checking node status..."

 cd /root/farcaster/apps/hubble/

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
  echo "All node's containers are running!"
  docker compose ps
  echo "check last 60 sec. logs" && timeout 60s docker compose logs -f --tail 100 hubble || true
 else
  echo "ERROR! Not all node's containers are running!"
  # Действия, если не все контейнеры запущены
 fi

else

 echo "ERROR! There is no farcaster, nothong to do"

fi
