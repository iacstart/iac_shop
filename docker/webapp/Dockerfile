from ruby:alpine3.10

ENV RACK_ENV=production
ENV SINATRA_ENV=production

ENV APP_PORT=4567
ENV APP_FILE=app.rb

RUN apk add --update \
  build-base \
  mariadb-dev \
  sqlite-dev \
  && rm -rf /var/cache/apk/*

ADD ./.gemrc ~/.gemrc

ADD ./startup.sh /

RUN mkdir -p /opt/webapp

WORKDIR /opt/webapp

EXPOSE 80 443

CMD ["/bin/ash", "/startup.sh"]
