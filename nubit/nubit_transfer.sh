if [ -d $HOME/nubit-node ] ; then

 echo "There is nubit. Checking status..."
 cd nubit-node
 output=$(docker compose ps)

 ### Проверяем, содержит ли вывод пустой заголовок docker compose ps
 if [ "$(echo "$output" | wc -l)" -eq 1 ]; then
  echo "ERROR: node's container is not working"
  echo "check last logs" && timeout 20s docker compose logs -f --tail 100 || true
 else
  echo "Node's container is working!"
  docker compose ps

  # Генерация случайного числа задержки в диапазоне от 1 до 6
  random_sleep=$(shuf -i 1-6 -n 1)
	
  # Генерация случайного числа количества в диапазоне от 1 до 100
  random_amount=$(shuf -i 1-100 -n 1)

  # Задержка на случайное количество секунд
  echo "Спим $random_sleep секунд..."
  sleep $random_sleep
	
  # Переводим токены
  echo "Transfering random amount: $random_amount"
  docker exec -it nubit-node $HOME/nubit-node/bin/nubit state transfer $ADDRESS $random_amount 500 100000  --node.store $HOME/.nubit-light-nubit-alphatestnet-1

 fi
  
else

 echo "ERROR: There is no nubit. Nothing to do"
 
fi
