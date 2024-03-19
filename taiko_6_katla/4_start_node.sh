cd $HOME/simple-taiko-node
if ! sudo ss -tulpn | grep LISTEN | awk '{print $5}' |  grep -e 8547 -e 8548 -e 6060 -e 30306 -e 9876 -e 9091 -e 3001; then 
	echo "All needed ports are free" 
	echo "Starting Taiko..." && docker compose up -d	
elif [ -d /opt/outline/ ] && docker ps | grep -q shadowbox ; then 
	echo "Some needed ports are occupied. Outline is here - probably it's a reason"
	echo "Stopping Outline..." && docker stop shadowbox watchtower
	echo "Starting Taiko..." && docker compose up -d	
	echo "Starting Outline..." && docker start shadowbox watchtower
else
	echo "Some needed ports are occupied and no Outline here. Plese check the reason"
fi
