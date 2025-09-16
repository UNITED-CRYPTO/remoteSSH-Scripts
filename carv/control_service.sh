#!/bin/bash

SERVICE="carv.service"

# Check unit's existance
if systemctl list-unit-files | grep -q "^$SERVICE"; then
    echo "Service $SERVICE is exist. Checking status.."
	sleep 2

    # Check unit's status
    if systemctl is-active --quiet $SERVICE; then
        echo "Service $SERVICE is Active. Installation isn't needed."
		sleep 2
		echo "Looking for 60s logs.."
		timeout 60s journalctl -u carv.service -b -f || true
        exit 0
    else
        echo "Service $SERVICE exist, but isn't Active. Trying to start.."
        systemctl start $SERVICE

            if systemctl is-active --quiet $SERVICE; then
                echo "$SERVICE is running!"
		        sleep 2
    	        echo ""
                echo "Looking for 60s logs.."
                timeout 60s journalctl -u carv.service -b -f || true
            else
                echo "Warning: $SERVICE failed to start."
            fi
		
        exit 0
    fi
else
    echo "Service $SERVICE not found. Trying to install.."
	sleep 2
    echo "Creating service $SERVICE.."
    mkdir -p carv
    cd carv

	tee carv.service > /dev/null <<EOF
[Unit]
Description=Carv node
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/verifier/
ExecStart=/root/verifier/bin/verifier -private-key $PRIVATE_KEY -reward-address $REVARD_ADDRESS -commission-rate 1
Restart=always

[Install]
WantedBy=multi-user.target
EOF

    echo "Service $SERVICE created!"
    sleep 2
    echo ""
    echo "Installing $SERVICE service.."

    cp carv.service /etc/systemd/system/

    systemctl daemon-reload
    systemctl enable carv.service

    echo "Service $SERVICE installed!"
    sleep 2
    echo ""
    echo "Starting $SERVICE service.."


    systemctl start carv.service

    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running!"
		sleep 2
    	echo ""
        echo "Looking for 60s logs.."
        timeout 60s journalctl -u carv.service -b -f || true
    else
        echo "Warning: $SERVICE failed to start."
    fi
fi
