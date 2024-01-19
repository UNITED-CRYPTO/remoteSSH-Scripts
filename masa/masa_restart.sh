#Рестарт
echo "masa restart" && sudo systemctl restart masad

#Логи
echo "masa last 20 sec. logs" && sudo timeout 20s journalctl -u masad -f --no-hostname -o cat || true

#Статус сервиса
echo "masa servise status" && sudo systemctl list-units --type service | grep masa

#Порты
echo "masa used ports (must be 8080, 4001, 5353)" && sudo ss -tulpn | grep masa
