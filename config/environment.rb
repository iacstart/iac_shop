ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'

# prometheus = Prometheus::Client.registry
# gauge = Prometheus::Client::Gauge.new(:app_info, docstring: 'Infos about app', labels: [:version, :status])
# prometheus.register(gauge)
# gauge.set(1.0, labels: {version: AppSetting.first.version_number, status: AppSetting.first.status})
