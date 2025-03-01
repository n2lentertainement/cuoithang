# Sử dụng Docker-in-Docker (dind)
FROM docker:24.0.7-dind

# Cài đặt Python, Bash và Curl
RUN apk add --no-cache python3 py3-pip bash curl vim

# Copy script khởi động vào container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Chạy Docker daemon trong container và script khởi động
CMD ["sh", "/start.sh"]
