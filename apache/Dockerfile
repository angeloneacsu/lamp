FROM httpd:2.2.34-alpine

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:80 || exit 1
EXPOSE 80
COPY ./index.html /usr/local/apache2/htdocs/

