dir
df -hT | grep sda3 | awk '{print $1 echo '-' $5 echo "G Available"}'
echo "Dashboard address: http://$(hostname -I | awk '{print $1}'):3001"
