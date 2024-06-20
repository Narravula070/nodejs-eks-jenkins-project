FROM amazonlinux:2
WORKDIR /usr/src/app
RUN yum -y update && \
    yum -y install curl && \
    curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum -y install nodejs
COPY package*.json ./
RUN npm install
RUN npm install express
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]
