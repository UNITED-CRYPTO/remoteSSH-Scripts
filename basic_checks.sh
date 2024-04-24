echo "git check"
git version

echo "docker check"
docker -v

echo "go check"
go version

echo "port check"
sudo ss -tulpn | grep LISTEN

echo "disk check"
df -hT | grep sda3 | awk '{print $1 echo '-' $5 echo "G Available"}'

echo "CPU load check"
uptime 

echo "RAM check"
free -h
