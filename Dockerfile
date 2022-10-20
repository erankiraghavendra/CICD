FROM nginx:latest
LABEL maintainer "raghavendra.eranki@infolob.com"
COPY ./index.html /usr/share/nginx/html/index.html