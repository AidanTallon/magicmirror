describe Forecast do
  it 'should initialize given latitude and longitude' do
    @forecast = Forecast.new @lat, @lon
    expect(@forecast.latitude).to eq @lat
    expect(@forecast.longitude).to eq @lon
  end
end
