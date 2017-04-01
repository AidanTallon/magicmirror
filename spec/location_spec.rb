describe Location do
  let(:location) { @location = Location.new }
  let(:location_stoke) { @location_stoke = Location.new latitude: 53, longitude: -2 }

  it 'should initialize with no params and return nil values for location' do
    expect(location.latitude).to eq nil
    expect(location.longitude).to eq nil
    expect(location.country).to eq nil
    expect(location.city).to eq nil
  end

  it 'should initialize with optional lat and lon params' do
    expect(location_stoke.latitude).to eq 53
    expect(location_stoke.longitude).to eq -2
    expect(location_stoke.country).to eq nil
    expect(location_stoke.city).to eq nil
  end

  it 'should fetch location data' do
    location_stoke.fetch
    expect(location_stoke.latitude).to eq 53
    expect(location_stoke.longitude).to eq -2
    expect(location_stoke.country).to eq "United Kingdom"
    expect(location_stoke.city).to eq "Stoke-on-Trent"
  end
end
