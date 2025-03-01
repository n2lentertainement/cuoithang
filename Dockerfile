# Sử dụng Docker-in-Docker (dind) phiên bản mới nhất
FROM docker:24.0.7-dind

# Cài đặt một số công cụ hữu ích
RUN apk add --no-cache bash curl vim

# Copy script khởi động vào container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Chạy Docker daemon trong container và script khởi động
CMD ["sh", "/start.sh"]
