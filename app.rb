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
  location = Location.new
  location.fetch latitude: AppConfig.latitude, longitude: AppConfig.longitude
  forecast = Forecast.new location, ENV['FORECAST_IO_API_KEY']
  erb :weather, :locals => 
    {
      location: location,
      forecast: forecast
    }
end
