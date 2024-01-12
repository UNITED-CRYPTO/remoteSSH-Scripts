cd masa-oracle-go-testnet
# Запуск ноды в интерактивном режиме на 10 сек. "|| true" - вернет 0, даже если процесс будет убит по таймауту.
timeout 10s ./masa-node --start || true
