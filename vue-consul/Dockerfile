FROM node:14-buster AS builder
ADD . /vue
WORKDIR /vue
RUN npm install --registry=https://registry.npmmirror.com && npm run build:prod

FROM nginx:stable-alpine
WORKDIR /www
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=builder /vue/default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=builder /vue/dist dist/

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80