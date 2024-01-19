#Нода Masa по умолчанию использует порт 8080. Но если порт на сервере используется, то сервис Masa выдаст ошибку "[ERROR] listen tcp :8080: bind: address already in use". Здесь мы меняем порт на другой, который свободен (см. sudo ss -tulpn)

sudo ss -tulpn | grep 8081

sudo tee /root/.masa/masa_oracle_node.env > /dev/null <<EOF
private.key=/root/.masa/masa_oracle_key
PORT=8081
EOF
