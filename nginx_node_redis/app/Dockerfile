FROM ubuntu:trusty

RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
    apt-get -y install python build-essential nodejs

RUN npm install -g nodemon

ADD package.json /tmp/package.json

RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

WORKDIR /src
ADD . /src

EXPOSE 8080

# CMD ["/bin/bash"]
CMD ["nodemon", "app.js"]

