FROM nginx:stable-alpine

RUN apk add --no-cache curl iputils

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
