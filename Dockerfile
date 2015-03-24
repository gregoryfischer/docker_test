FROM ubuntu:14.04.2
MAINTAINER GFISCHER <gfischer@adobe.com>
RUN apt-get update && apt-get upgrade -y && apt-get -y install wget zip gcc python ruby make git rsyslog build-essential

# Install NodeJS
RUN mkdir -pv /tmp/nodejs \
    && wget -P /tmp/nodejs http://nodejs.org/dist/v0.10.36/node-v0.10.36-linux-x64.tar.gz \
    && cd /tmp/nodejs \
    && tar zxf node-*.tar.gz \
    && cd node-* \
    && mv bin/node /usr/local/bin/node \
    && mv lib/node_modules /usr/local/lib/node_modules \
    && mv bin/npm /usr/local/bin/npm \
    && echo `node --version` \
    && echo `npm --version`

COPY . /src
RUN cd /src/src
CMD ["npm", "install"]
RUN ls

EXPOSE 8080

CMD ["node", "/src/src/server.js"]
