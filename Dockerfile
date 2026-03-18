FROM nginx:alpine
COPY . /usr/share/nginx/html/
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO /dev/null http://localhost/ || exit 1
