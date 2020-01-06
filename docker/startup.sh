#!/usr/bin/env bash

if [ "$RUBY_ENV" == "production" ]; then
  bundle config set without development test
fi

bundle install
# bundle exec ruby $APP_FILE -p $APP_PORT -o '0.0.0.0'

bundle exec rackup -p $APP_PORT -o '0.0.0.0'
