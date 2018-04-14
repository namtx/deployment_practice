FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils

ENV RAILS_ROOT /var/www/noteapp
WORKDIR $RAILS_ROOT

RUN mkdir log

COPY nginx-app.conf /tmp/docker_example.nginx
# COPY .htpasswd /etc/nginx/.htpasswd

RUN envsubst "$RAILS_ROOT" < /tmp/docker_example.nginx > /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g","daemon off;"]
