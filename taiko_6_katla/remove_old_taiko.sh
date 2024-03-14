#Удаление старых контейнеров
cd simple-taiko-node/
docker compose down -v
cd ~
mv simple-taiko-node/ simple-taiko-node_old/
