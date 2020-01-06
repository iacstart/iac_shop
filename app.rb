require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"
require "sinatra/json"
require 'haml'
require 'prometheus_exporter/client'

# require 'pry'

# class DigitalPowerKlausurtagung < Sinatra::Base
  set :haml, :format => :html5
  app_state = 'ready'

  get '/' do
    params[:app_status] = app_state
    if app_state == 'ready'
      haml :index
    else
      status 500
    end
  end

  get '/status' do
    status 200
  end

  post '/notification' do
    income_message = request.body
    payload = JSON.parse(request.body.read)
    app_state = payload["change"]
  end


  get '/metrics' do
    # dummy
  end

  error 400..500 do
    haml :error
  end
# end
