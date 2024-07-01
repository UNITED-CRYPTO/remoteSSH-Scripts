# Meson commands
if [ -d $HOME/meson_cdn-linux-amd64 ] ; then 
	echo "There is $HOME/meson_cdn-linux-amd64, removing..."
	cd $HOME/meson_cdn-linux-amd64
	sudo ./service stop meson_cdn
	sudo ./service remove meson_cdn
	cd $HOME
	mv meson_cdn-linux-amd64/ meson_cdn-linux-amd64_old/
 	echo "meson_cdn-linux-amd64 removed!"
else
	echo "There is no $HOME/meson_cdn-linux-amd64"
fi

# GaGaNode commands
if [ -d $HOME/apphub-linux-amd64 ] ; then 
	echo "There is $HOME/apphub-linux-amd64, removing..."
	cd $HOME/apphub-linux-amd64
	sudo ./apphub service stop
	sudo ./apphub service remove
	cd $HOME
	mv apphub-linux-amd64/ apphub-linux-amd64_old/
 	echo "apphub-linux-amd64 removed!"
else
	echo "There is no $HOME/apphub-linux-amd64"
fi
