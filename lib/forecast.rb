class Forecast
  attr_reader :latitude, :longitude, :current, :api_key
  require 'forecast_io'

  def initialize(latitude:, longitude:, api_key:)
    @latitude = latitude
    @longitude = longitude
    @api_key = api_key
  end

  def fetch
    ForecastIO.api_key = @api_key
    data = ForecastIO.forecast @latitude, @longitude, { params: { units: 'si', excludes: 'minutely,hourly,daily,alerts,flags' } }
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
        summary:      nil,
        icon:         nil,
        temperature:  nil
      }
    end
  end
end
