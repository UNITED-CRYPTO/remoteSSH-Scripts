if [ -d $HOME/farcaster ] ; then

 echo "There is already farcaster. No need inastall."
 echo "check last 20 sec. logs" && timeout 20s docker compose logs -f hubble || true

else

 echo "There is no farcaster. Trying install..."

 sudo tee test_file > /dev/null <<EOF
 test
 EOF
 
fi
