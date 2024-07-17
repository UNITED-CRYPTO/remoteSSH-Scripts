# Журналы

if [ -d $HOME/farcaster ] ; then

 echo "There is farcaster. Printing logs..."
 cd /root/farcaster/apps/hubble/
 echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true

else

 echo "There is no farcaster, nothong to do"

fi
