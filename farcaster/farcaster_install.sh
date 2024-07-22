if [ -d $HOME/farcaster ] ; then

 echo "There is already farcaster. No need to install."
 #cd /root/farcaster/apps/hubble/
 #echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true

else

 echo "There is no farcaster. Trying to install..."

 # Клонируем репо farcaster
 git clone --recurse-submodules  https://github.com/farcasterxyz/hub-monorepo.git farcaster

 cd /root/farcaster/apps/hubble/

 # Создадим рабочие директории для контейнера и на всякий случай зададим права текущего пользователя на папки .hub .rocks
 sudo mkdir .hub/ .rocks/
 sudo chown -R $USER:$USER .hub .rocks
 sudo chmod -R 777 .hub .rocks

 # Зададим права доступа для контейнера Grafana к директории /root/farcaster/apps/hubble/grafana/data
 sudo mkdir ./grafana/data
 sudo chown -R 472:472 ./grafana/data

 # Генерируем пару ключей идентификации с помощью Docker Compose
 docker compose run hubble yarn identity create

 # В норме должно выдать такое:
 #{"hostname":"[some_hostname]","pid":28,"time":1719918738294,"level":30,"msg":"Flushing rust log buffer. Writing logs directly from Rust","flush_next":true}
 #{"level":30,"time":1719918738295,"pid":28,"hostname":"[some_hostname]","msg":"Wrote peerId: [some ID] to #/home/node/app/apps/hubble/.hub/[some ID]_id.protobuf"}
 #{"level":30,"time":1719918738294,"pid":28,"hostname":"[some_hostname]","msg":"Wrote peerId: [some ID] to /home/node/app/apps/hubble/.hub/default_id.protobuf"}

 # Создание файла .env скриптом
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

 # Запуск контейнера с нодой и мониторингом
 echo "Starting the node..."
 docker compose up hubble statsd grafana -d
 sleep 10
 # Если видим Hubble requires at least 16GB of RAM to run. Detected 7GB, то сервер имеет недостаточно памяти

 # Проверяем статус ноды *******************************************
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
   echo "Node successfully installed and started!"
   docker compose ps
   echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true
  else
   # Действия, если не все контейнеры запущены
   echo "ERROR! Node installed, but not all node's containers are running!"
   docker compose ps
  fi
 # ******************************************* 
 
fi
