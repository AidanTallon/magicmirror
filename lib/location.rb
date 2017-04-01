class Location
  include HTTParty
  attr_reader :latitude, :longitude, :country, :city
  base_uri 'https://freegeoip.net'

  def initialize(latitude: nil, longitude: nil)
    @latitude = latitude
    @longitude = longitude
    @country = nil
    @city = nil
  end

  def fetch
    if @latitude.nil? or @longitude.nil?
      get_location_from_ip
    end
    get_location_data
  end

  def get_location_from_ip
    loc = self.class.get('/json')
    @latitude = loc['latitude']
    @longitude = loc['longitude']
  end

  def get_location_data
    location_data = Geocoder.search("#{@latitude}, #{@longitude}").first
    if location_data
      location_data.data['address_components'].each do |d|
        if d['types'].include? 'postal_town'
          @city = d['long_name']
        elsif d['types'].include? 'country'
          @country = d['long_name']
        end
      end
    end
    @city = 'unknown' if @city.nil?
    @country = 'unknown' if @country.nil?
  end
end
