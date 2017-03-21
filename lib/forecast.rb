class Forecast
  attr_reader :latitude, :longitude
  
  def initialize(lat, lon)
    @latitude = lat
    @longitude = lon
  end
end
