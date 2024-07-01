#Логи
#echo "masa last 20 sec. logs" && sudo timeout 20s journalctl -u masad -f --no-hostname -o cat || true

#Статус сервиса
echo "masa servise status" && sudo systemctl list-units --type service | grep masa

#Порты
echo "masa used ports" && sudo ss -tulpn | grep masa

#Папки
if [ -d $HOME/masa-oracle-go-testnet ] ; then 
	echo "There is $HOME/masa-oracle-go-testnet"
else
	echo "There is no $HOME/masa-oracle-go-testnet"
fi
