require 'sinatra'
require 'dotenv/load'
require 'forecast_io'
require 'geoip'
require 'httparty'
require './lib/forecast.rb'
require './lib/location.rb'

require 'pry'

get '/' do
  erb :index
end
