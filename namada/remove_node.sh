#Удаление старых контейнеров

if [ -d $HOME/namada ] ; then 
	echo "There is namada, removing..."
 	systemctl stop namadad
	systemctl disable namadad
	rm -rf ~/namada ~/.local/share/namada /etc/systemd/system/namadad.service
	echo "Namada is removed!" 

else
	echo "There is no namada, nothing to do"
fi
