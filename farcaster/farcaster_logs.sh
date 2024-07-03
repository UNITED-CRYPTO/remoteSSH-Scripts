# Журналы
cd /root/farcaster/apps/hubble/
echo "check last 20 sec. logs" && timeout 20s docker compose logs -f --tail 100 hubble || true
