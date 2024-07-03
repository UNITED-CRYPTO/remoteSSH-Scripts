if [ -d $HOME/farcaster ] ; then

 echo "There is farcaster. Trying uninastall..."
 cd /root/farcaster/apps/hubble/
 echo "Stopping and remove containers..." && docker compose down -v
 cd ~
 echo "Deleting farcaster dir..." && rm -rf farcaster/ && echo "Farcaster uninstalled!"

else

 echo "There is no farcaster, nothong to do"

fi
