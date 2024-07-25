if [ -d $HOME/nubit-node ] ; then

 echo "There is nubit. Checking status..."
 cd nubit-node
 output=$(docker compose ps)

 ### Проверяем, содержит ли вывод пустой заголовок docker compose ps
 if [ "$(echo "$output" | wc -l)" -eq 1 ]; then
  echo "ERROR: node's container is not working"
 else
  echo "Node's container is working!"
  docker compose ps
  echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 || true
 fi
  
else

 echo "ERROR: There is no nubit. Nothing to do"
 
fi
