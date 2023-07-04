echo "Hello from ziesha_upd.sh"
printenv
#cd bazuka && git pull && cargo update && cargo install --path . && rm -rf ~/.bazuka ~/.bazuka-wallet && rm -rf ~/.bazuka
bazuka init --mnemonic "$MNEMONIC"
#sudo systemctl restart ziesha
#sleep 20
#$HOME/.cargo/bin/bazuka node status | grep -e "version" -e "height" -e "network"
#sleep 5
#$HOME/.cargo/bin/bazuka node status | grep "height"
#sleep 5
#$HOME/.cargo/bin/bazuka node status | grep "height"
#sleep 5
#$HOME/.cargo/bin/bazuka node status | grep "height"
