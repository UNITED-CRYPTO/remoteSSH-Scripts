echo "download masa repo" && git clone https://github.com/masa-finance/masa-oracle-go-testnet.git
cd masa-oracle-go-testnet
echo "build masa-node" && go build -v -o masa-node ./cmd/masa-node
