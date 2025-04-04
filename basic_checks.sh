echo "git check"
git version

echo "docker check"
docker -v

echo "go check"
go version

echo "make version check"
make -v

echo "screen version check"
screen -v

echo "GLIBC version check"
ldd --version

echo "port check"
sudo ss -tulpn | grep LISTEN

echo "disk check"
df -hT | grep sda3 | awk '{print $5 echo " Available on Disk"}'
disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk_used_percentage $disk_usage"

echo "CPU load check"
uptime 

echo "RAM check"
free -h

## Проверка контейнеров
docker ps -a

## Обслуживание
# Очистка кеша пакетов APT
	#sudo apt-get clean
	#sudo apt-get autoclean
	#sudo apt-get autoremove -y
  
# Удаление старых журналов
	#sudo journalctl --vacuum-time=2d
	
# Очистка временных файлов
	#sudo rm -rf /tmp/*

# Удаление неиспользуемых Docker-объектов
	#docker system prune -a -f

#random_sleep=$(shuf -i 1-600 -n 1)
#echo "Спим $random_sleep секунд..."
#sleep $random_sleep

## Тест скорости
#if command -v speedtest &> /dev/null
#then
#    echo "speedtest-cli уже установлен. Запускаю тест скорости..."
#    speedtest
#else
#    echo "speedtest-cli не найден. Устанавливаю..."
#    sudo apt update
#    sudo apt install -y speedtest-cli
#    speedtest
#fi
