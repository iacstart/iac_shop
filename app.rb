require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"
require "sinatra/json"
require 'haml'
require 'prometheus_exporter/client'

# require 'pry'

class ApplicationController < Sinatra::Base

  configure :production, :development do
    set :haml, :format => :html5, :layout => :'layouts/main'
    # set :views, "views"
    # set :public_dir, 'public'
    enable :logging
  end

  @app_state = 'okay'

  def is_hacked?
    return @app_state != 'okay'
  end

  get '/' do
    haml :index
  end

  get '/status' do
    logger.info "app_state: #{@app_state}"

    if is_hacked?
      @app_state = 'error'
      status 500
    else
      haml :status, :layout => :'layouts/status'
    end
  end

  post '/notification' do
    payload = JSON.parse(request.body.read)
    @app_state = payload["change"]
    redirect('/status')
  end


  get '/metrics' do
    # dummy
  end

  error 400..500 do
    haml :error, :layout => :'layouts/status'
  end
end
