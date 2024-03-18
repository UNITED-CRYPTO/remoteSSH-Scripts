# Simple Taiko Node использует порты:

# PORT_L2_EXECUTION_ENGINE_HTTP=8547
# PORT_L2_EXECUTION_ENGINE_WS=8548
# PORT_L2_EXECUTION_ENGINE_METRICS=6060
# PORT_L2_EXECUTION_ENGINE_P2P=30306
# PORT_PROVER_SERVER=9876
# PORT_PROMETHEUS=9091
# PORT_GRAFANA=3001

# Проверить их доступность можно так:
if ! sudo ss -tulpn | grep LISTEN | awk '{print $5}' |  grep -e 8547 -e 8548 -e 6060 -e 30306 -e 9876 -e 9091 -e 3001; then 
	echo "All needed ports are free" 
else
	echo "Some needed ports are occupied"
fi
