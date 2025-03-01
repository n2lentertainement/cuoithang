FROM docker:dind

RUN apk add --no-cache bash curl

# Copy script khởi động Docker bên trong
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
