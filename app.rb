require 'sinatra'
require 'dotenv/load'
require 'forecast_io'
require 'geocoder'
require 'geoip'
require 'httparty'

Dir[File.join(Dir.pwd, 'lib/*.rb')].each { |f| require f }

require 'pry'
require 'json'

get '/' do
  erb :index
end

get '/weather' do
  content_type :html
  location = Location.new latitude: AppConfig.latitude, longitude: AppConfig.longitude
  location.fetch
  forecast = Forecast.new latitude: location.latitude, longitude: location.longitude, api_key: ENV['FORECAST_IO_API_KEY']
  forecast.fetch
  erb :weather, :locals => 
    {
      location: location,
      forecast: forecast
    }
end
