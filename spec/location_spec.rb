describe Location do
  it 'should return latitude and longitude values' do
    @location = Location.new
    expect(@location).to respond_to(:latitude)
    expect(@location).to respond_to(:longitude)
  end

  it 'should initialize with values for latitude and longitude' do
    @location = Location.new latitude: 12, longitude: 13
    expect(@location.latitude).to eq 12
    expect(@location.longitude).to eq 13
  end

  it 'should get a place name from lat/lon values' do
    @location = Location.new latitude: 53, longitude: -2
    expect(@location.country).to eq 'United Kingdom'
    expect(@location.city).to eq 'Stoke-on-Trent'
  end
end
