FROM node:current-alpine3.12

RUN npm install -g aws-cdk

WORKDIR /app
