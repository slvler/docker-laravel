FROM nginx:latest
COPY ./config/nginx/ /etc/nginx/conf.d
