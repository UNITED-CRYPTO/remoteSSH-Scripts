if [ -d $HOME/farcaster ] ; then

 echo "There is already farcaster. No need inastall."
 cd /root/farcaster/apps/hubble/
 echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true

else

 echo "There is no farcaster. Trying install..."

 # Клонируем репо farcaster
 git clone --recurse-submodules  https://github.com/farcasterxyz/hub-monorepo.git farcaster

 cd /root/farcaster/apps/hubble/

 # Создадим рабочие директории для контейнера и на всякий случай зададим права текущего пользователя на папки .hub .rocks
 sudo mkdir .hub/ .rocks/
 sudo chown -R $USER:$USER .hub .rocks
 sudo chmod -R 777 .hub .rocks

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

EOF

 # Запуск контейнера с нодой
 docker compose up hubble -d
 # Если видим Hubble requires at least 16GB of RAM to run. Detected 7GB, то сервер имеет недостаточно памяти

 # Журналы
 echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true

fi
