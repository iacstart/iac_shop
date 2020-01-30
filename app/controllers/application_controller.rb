class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure :production, :development do
    set :haml, :format => :html5, :layout => :'layouts/main'
    set :views, "app/views"
    set :public_dir, 'public'
    enable :sessions
    set :session_secret, "33886b1bf399f8c052b04244ab97a088"
    enable :logging
    enable :cross_origin

    # I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
  end

  # prometheus = Prometheus::Client.registry
  # gauge = Prometheus::Client::Gauge.new(:app_info, docstring: 'Infos about app', labels: [:version, :status])
  # prometheus.register(gauge)
  # gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})

  @app_state ||= "okay"

  def is_hacked?
    return @app_state != 'okay'
  end

  get '/' do
    # gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})
    @devices = AppDevice.all
    haml :index
  end

  get '/status' do
    logger.debug "app_state: #{@app_state}"
    app_settings = AppSetting.all
    @app_state = app_settings.first.status
    # gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})

    if is_hacked?
      @app_state = 'error'
      status 500
    else
      haml :status, :layout => :'layouts/status'
    end
  end

  post '/notification' do
    payload = JSON.parse(request.body.read)
    logger.debug "payload: #{payload}"

    # public_key = OpenSSL::PKey::RSA.new(File.read('./files/jwt_token_rsa_pem.pub'))

    app_setting = AppSetting.first
    app_setting.status = payload["change"]
    app_setting.save!

    @app_state = app_setting.status
    logger.debug "app_state_2: #{@app_state}"

    redirect('/status')
  end


  get '/metrics' do
    # gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})

    # dummy
  end

  error 400..500 do
    haml :error, :layout => :'layouts/status'
  end

  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
end
