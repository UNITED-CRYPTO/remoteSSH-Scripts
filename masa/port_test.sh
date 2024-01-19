sudo systemctl stop masad

sudo ss -tulpn | grep -e "8080" -e "4001" -e "5353"

sudo systemctl start masad
