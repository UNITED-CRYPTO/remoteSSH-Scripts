#Логи
sudo timeout 20s journalctl -u masad -f --no-hostname -o cat || true

#Статус сервиса
sudo systemctl list-units --type service | grep masa
