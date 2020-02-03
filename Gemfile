source "https://rubygems.org"

# gem 'sqlite3', '~> 1.3.6'
gem "sinatra"
gem "activerecord", require: 'active_record'
gem "sinatra-activerecord", :require => 'sinatra/activerecord'
gem "sinatra-contrib"
gem 'rake'
gem 'require_all'
gem "haml"

gem 'faker'
gem 'jwt'

gem 'prometheus_exporter'
gem 'prometheus-client'


group :sqlite do
  gem "sqlite3"
end

group :mysql do
  gem "mysql2"
end

group :development do
  # gem "tux"
  gem "sinatra-reloader"
  gem 'rack-console'
  gem 'pry'
end
