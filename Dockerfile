FROM node:10.14

EXPOSE 8080

WORKDIR /frontend

COPY . /frontend

RUN yarn add @vue/cli @vue/cli-init --global
RUN yarn install

CMD yarn run dev
