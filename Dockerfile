FROM nginx:1.28-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY sites/ /srv/pages/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=3s --retries=3 \
  CMD wget --quiet --output-document=- http://127.0.0.1/healthz >/dev/null || exit 1

CMD ["nginx", "-g", "daemon off;"]
