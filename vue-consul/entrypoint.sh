#!/bin/sh
# entrypoint.sh

envsubst '${UPSTREAM}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

echo "--- Generated Nginx Config ---"
cat /etc/nginx/conf.d/default.conf
echo "------------------------------"

exec nginx -g 'daemon off;'