#!/bin/sh

# Chạy Docker daemon
dockerd &

# Chờ Docker daemon sẵn sàng
echo "Đang khởi động Docker daemon..."
while(! docker info > /dev/null 2>&1); do
    sleep 1
done
echo "Docker daemon đã sẵn sàng!"

# Chạy các container mong muốn
docker run --name repocket -e RP_EMAIL=johnhoang@hvnteam.com -e RP_API_KEY=9106d586-2653-480d-80ad-14fe6692a5f5 -d --restart=always repocket/repocket
docker run -d --restart=always -e EARNFM_TOKEN="053ef290-da8f-40f2-bd33-bc2a1eef9a0e" --name earnfm-client earnfm/earnfm-client:latest
docker run -d --restart=always --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --include-stopped --include-restarting --revive-stopped --interval 60 earnfm-client
docker run -d --name tm traffmonetizer/cli_v2 start accept --token hQGZw0pjXJBcEMb6hp5cClJaa0rbu1zERwtvlGfyWcQ=
docker run -d --restart unless-stopped packetshare/packetshare -accept-tos -email=johnhoang@hvnteam.com -password=Matkhau123

# Mở port 8000 bằng Python server (chỉ để giữ container chạy)
echo "Starting web server on port 8000..."
python3 -m http.server 8000 --bind 0.0.0.0 &

# Giữ container chạy
tail -f /dev/null
