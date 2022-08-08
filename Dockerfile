FROM ruby:3.1.2-alpine

ENV LANG C.UTF-8

RUN apk update && \
    apk add --no-cache build-base  && \
    apk add --update nodejs npm git git-subtree

RUN gem install bundler
RUN npm install -g yarn gulp

RUN mkdir /app
WORKDIR /app