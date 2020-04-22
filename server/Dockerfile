FROM node:11-alpine

RUN mkdir -p /usr/src/server

WORKDIR /usr/src/server

COPY . .
RUN npm install -g gulp-cli
RUN npm install
RUN gulp build


EXPOSE 8080

CMD ["npm", "run", "start"]