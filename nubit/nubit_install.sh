if [ -d $HOME/nubit-node ] ; then

 echo "There is already nubit. No need to install."

else

 echo "There is no nubit. Trying to install..."

 # Генерация случайного числа в диапазоне от 1 до 60 (1 мин)
 random_sleep=$(shuf -i 1-60 -n 1)

 # Задержка на случайное количество секунд
 echo "Спим $random_sleep секунд..."
 sleep $random_sleep
 
 mkdir nubit-node
 cd nubit-node

 echo "Creating docker file..."
 sudo tee Dockerfile > /dev/null <<EOF
FROM ubuntu:latest

# Install needed utilities
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    tar \
    procps \
    bash \
    coreutils \
    gawk \
    sed \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set work DIR
WORKDIR /root

# Download and run script
CMD curl -sL1 https://nubit.sh | bash && tail -f /var/log/nubit.log

EOF

 echo "Creating docker-compose.yml file..."
 sudo tee docker-compose.yml > /dev/null <<EOF
services:
  nubit-node:
    build: .
    container_name: nubit-node
    volumes:
      - ~/nubit-node/nubit-data:/root/nubit-node
      - ~/nubit-node/.nubit-light-nubit-alphatestnet-1:/root/.nubit-light-nubit-alphatestnet-1
    ports:
      - "26657:26657"
      - "26658:26658"
      - "26659:26659"
      - "9191:9090"
      - "2121:2121/udp"
      - "2121:2121"
    restart: always

volumes:
  nubit-data:
    driver: local

EOF

 # Increase send net buffer size
 echo "Increase send net buffer size..."
 sudo sysctl -w net.core.rmem_max=2621440
 sudo sysctl -w net.core.rmem_default=2621440
 sudo sysctl -w net.core.wmem_max=2621440
 sudo sysctl -w net.core.wmem_default=2621440
 sudo sysctl -w net.core.optmem_max=2621440
 sudo sysctl -p
 sudo systemctl restart docker
 sleep 5
 
 # Сборка образа и запуск контейнера
 echo "Building docker image..."
 docker compose build
 sleep 5

 echo "Staring docker..."
 docker compose up -d
 sleep 5
 
 # Журналы
 echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 || true

fi
