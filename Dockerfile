FROM node:8

RUN yarn global add pm2

WORKDIR /src

ADD package.json package.json

RUN yarn install && yarn cache clean

COPY . /src

EXPOSE 5000

# CMD pm2 start --no-daemon index.js
CMD pm2 start --no-daemon  processes.json
