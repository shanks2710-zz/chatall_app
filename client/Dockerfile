FROM node:12-alpine AS builder

COPY . ./client

WORKDIR /client

RUN npm i
RUN $(npm bin)/ng build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder /client/dist/client/ /usr/share/nginx/html