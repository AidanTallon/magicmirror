class Forecast
  attr_reader :latitude, :longitude, :country, :city, :current
  require 'forecast_io'

  def initialize(location)
    @latitude = location.latitude
    @longitude = location.longitude
    @country = location.country
    @city = location.city
    ForecastIO.api_key = ENV['FORECAST_IO_API_KEY']
    fetch
  end

  def fetch
    data = ForecastIO.forecast @latitude, @longitude
    @current =
    {
      summary:      data['currently']['summary'],
      icon:         data['currently']['rain'],
      temperature:  data['currently']['temperature']
    }
  end
end
