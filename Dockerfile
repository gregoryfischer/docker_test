FROM ubuntu:14.04.2
MAINTAINER GFISCHER <gfischer@adobe.com>

# Install utils
RUN apt-get -y install wget zip gcc git

# Install NodeJS

RUN mkdir -pv /tmp/nodejs \
    && wget -P /tmp/nodejs http://nodejs.org/dist/v0.10.36/node-v0.10.36-linux-x64.tar.gz \
    && cd /tmp/nodejs \
    && tar zxf node-*.tar.gz \
    && cd node-* \
    && cp bin/node /usr/local/bin/node \
    && cp bin/npm /usr/local/bin/npm

CMD ["node", "--version"]
CMD ["npm", "--version"]

COPY . /src
RUN cd /src/src
CMD ["npm", "install"]
RUN ls

EXPOSE 8080 80

CMD ["node", "/src/src/server.js"]
