if [ -d $HOME/nubit-node ] ; then

 echo "There is nubit. Checking data..."
 
 cd nubit-node
 
 echo "Printing NAME / ADDRESS / PUBKEY..."
 docker exec -it nubit-node $HOME/nubit-node/bin/nkey list --p2p.network nubit-alphatestnet-1 --node.type light

 if [ -e $HOME/nubit-node/nubit-data/mnemonic.txt ]; then
  echo "MNEMONIC: $(cat $HOME/nubit-node/nubit-data/mnemonic.txt)"
	fi
 
 echo "Printing BALANCE..."
 docker exec -it nubit-node $HOME/nubit-node/bin/nubit state balance --node.store $HOME/.nubit-light-nubit-alphatestnet-1

else

 echo "ERROR: There is no nubit. Nothing to do"

fi
