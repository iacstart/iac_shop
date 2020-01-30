ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
ENV['RUBY_ENV'] ||= "development"

require 'bundler'
require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

require "sinatra/activerecord"
# set :database, {adapter: "sqlite3", database: "#{ENV['SINATRA_ENV']}.sqlite3"}

require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"
require "sinatra/json"
require 'haml'

require 'prometheus/client'
require 'faker'
require 'jwt'

require 'pry'

# require './app/controllers/application_controller'
require_all 'app'


# prometheus = Prometheus::Client.registry
# gauge = Prometheus::Client::Gauge.new(:app_info, docstring: 'Infos about app', labels: [:version, :status])
# prometheus.register(gauge)
# gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})
