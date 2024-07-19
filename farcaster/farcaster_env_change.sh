# Изменение .env файла

## Проверяем установлен ли farcaster
if [ -d $HOME/farcaster ] ; then
 echo "There is farcaster. Changing node config..."
 
 ## Останавливаем ноду
 echo "Stopping node..."
 cd /root/farcaster/apps/hubble/
 docker compose stop
 sleep 5
 
 ## Проверяем остановлена ли нода
 ### Выполнение команды docker compose ps и сохранение вывода в переменную
 output=$(docker compose ps)

 ### Проверяем, содержит ли вывод только заголовок docker compose ps
 if [ "$(echo "$output" | wc -l)" -eq 1 ]; then
  echo "Node successfully stopped!"
  
  #### Действия, если все контейнеры остановлены

  #### Создание файла .env
  echo "Creating a new .env"
  sudo tee .env > /dev/null <<EOF
# Set this to your L1 Mainnet ETH RPC URL
ETH_MAINNET_RPC_URL=$ETH_RPC

# Set this to your L2 Optimism Mainnet RPC URL
OPTIMISM_L2_RPC_URL=$OPTIMISM_RPC

# Set this to your Farcaster FID
HUB_OPERATOR_FID=$MY_FID

FC_NETWORK_ID=1
BOOTSTRAP_NODE=/dns/nemes.farcaster.xyz/tcp/2282

STATSD_METRICS_SERVER=statsd:8125

EOF

  #### Запуск контейнера с нодой и мониторингом
  echo "Starting the node..."
  docker compose up -d
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
   echo "Node successfully started!"
   echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true
  else
   # Действия, если не все контейнеры запущены
   echo "ERROR! Not all node's containers are running!"   
  fi
  # *******************************************  
 
 else
  ### Действия, если какие-то контейнеры все еще работают
  echo "ERROR: some node's parts is not stopped, exit without any changes"  
 fi 

else
 echo "ERROR: There is no farcaster, nothong to do"
fi
