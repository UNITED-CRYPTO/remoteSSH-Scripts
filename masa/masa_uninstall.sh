# Останов и удаление сервиса
sudo systemctl stop masad
sudo systemctl disable masad
sudo systemctl daemon-reload

# Удаление данных
rm - rf masa-oracle-go-testnet
sudo rm /etc/systemd/system/masad.service

# Проверка
sudo cat /etc/systemd/system/masad.service
ls -la
