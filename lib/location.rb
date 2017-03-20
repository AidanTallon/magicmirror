class Location
  include HTTParty
  base_uri 'https://www.googleapis/com'

  @@api_key = ENV['GOOGLE_MAPS_API_KEY']

  def initialize
    loc = self.class.get("/v1/geolocat?key=#{@@api_key}")
    @latitude = loc['location']['lat']
    @longitude = loc['location']['lng']
  end
end
