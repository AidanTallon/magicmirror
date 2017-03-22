class Forecast
  attr_reader :latitude, :longitude, :country, :city, :current
  require 'forecast_io'

  def initialize(location, api_key)
    @latitude = location.latitude
    @longitude = location.longitude
    @country = location.country
    @city = location.city
    ForecastIO.api_key = api_key
    fetch
  end

  def fetch
    data = ForecastIO.forecast @latitude, @longitude
    if data
      @current =
      {
        summary:      data['currently']['summary'],
        icon:         data['currently']['icon'],
        temperature:  data['currently']['temperature']
      }
    else
      @current =
      {
        summary:      "error",
        icon:         "error",
        temperature:  "error"
      }
    end
  end
end
