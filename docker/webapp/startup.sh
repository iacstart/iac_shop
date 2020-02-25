#!/usr/bin/env bash

if [ "$SINATRA_ENV" == "production" ]; then
  bundle config set without development test
fi

bundle install
# bundle exec ruby $APP_FILE -p $APP_PORT -o '0.0.0.0'

rm -f db/*.sqlite3

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:setup

bundle exec rackup -p $APP_PORT -o '0.0.0.0'
