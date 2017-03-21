require 'sinatra'
require 'dotenv/load'
require 'forecast_io'
require 'geocoder'
require 'geoip'
require 'httparty'

Dir[File.join(Dir.pwd, 'lib/*.rb')].each { |f| require f }

require 'pry'

get '/' do
  erb :index
end
