#Создание конфига сервиса
sudo tee /etc/systemd/system/masad.service > /dev/null <<EOF

[Unit]
Description=Masa Node
After=network.target
[Service]
Type=simple
User=$USER
WorkingDirectory=/root/masa-oracle-go-testnet/
ExecStart=/root/masa-oracle-go-testnet/masa-node --bootnodes=/ip4/35.224.231.145/udp/4001/quic-v1/p2p/16Uiu2HAm47nBiewWLLzCREtY8vwPQtr5jTqyrEoUo6WnngwhsQuR,/ip4/104.198.43.138/udp/4001/quic-v1/p2p/16Uiu2HAkxiP8jjdHQWeCxTr7pD6BvoPkS8Z1skjCy9vdSRMACDcc,/ip4/35.202.227.74/udp/4001/quic-v1/p2p/16Uiu2HAmHuUejpUBFPCxy32QhGRAbv3tFwbzXmLkCoaNcZTyWWqN,/ip4/10.128.0.47/udp/4001/quic-v1/p2p/16Uiu2HAkxiP8jjdHQWeCxTr7pD6BvoPkS8Z1skjCy9vdSRMACDcc,/ip4/107.223.13.174/udp/4001/quic-v1/p2p/16Uiu2HAm2uQ5TGviRkqhYMpg7fjeoB4TfpSAhrbY87YZ4h9jYCNm,/ip4/34.171.201.124/udp/4001/quic-v1/p2p/16Uiu2HAmCKzfsynicpryPZTdcJsjmyzXn8tA13zMHHsoBxLdvVCE,/ip4/34.132.48.64/udp/4001/quic-v1/p2p/16Uiu2HAmNk4DDNiVu8ipN2cg5GLpGzN6ydd4EYps1NkiTDBRkctu --port=4001 --udp=true --start=true
Restart=on-failure
RestartSec=10
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload

sudo systemctl enable masad

sudo systemctl start masad

#Логи
sudo timeout 20s journalctl -u masad -f --no-hostname -o cat || true

#Статус сервиса
sudo systemctl status masad
