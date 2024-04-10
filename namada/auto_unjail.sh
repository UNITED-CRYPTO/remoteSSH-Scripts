#Удаление старых контейнеров

if [ -d $HOME/simple-taiko-node ] ; then 
	echo "There is $HOME/simple-taiko-node, removing..."
	cd $HOME/simple-taiko-node
	docker compose down -v
	cd $HOME
	mv simple-taiko-node/ simple-taiko-node_old/
else
	echo "There is no $HOME/simple-taiko-node"
fi
