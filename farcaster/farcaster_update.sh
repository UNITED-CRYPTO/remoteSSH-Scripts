if [ -d $HOME/farcaster ] ; then

 echo "There is farcaster. Trying to update..."
 cd /root/farcaster/apps/hubble/
 echo "Making git checkout main && git pull..." && git checkout main && git pull
 echo "Restarting docker containers..." && docker compose stop && docker compose up -d --force-recreate --pull always
 echo "Check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true

else

 echo "There is no farcaster, nothong to do."

fi
