df -hT | grep sda3 | awk '{print $1 echo '-' $5 echo "G Available"}'
echo "Dashboard address: http://$(hostname -I | awk '{print $1}'):3001"

#Check if the Execution Layer client is synced by requesting the latest Taiko L2 / L3 block from the Execution Layer client:
curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}'
#If the blockNumber response value is 0 or not growing, check the Taiko L2 logs
