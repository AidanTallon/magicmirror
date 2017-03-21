describe Forecast do
  it 'should initialize given an instance of Location' do
    @forecast = Forecast.new Location.new latitude: 53, longitude: -2
    expect(@forecast.latitude).to eq 53
    expect(@forecast.longitude).to eq -2
    expect(@forecast.country).to eq 'United Kingdom'
    expect(@forecast.city).to eq 'Stoke-on-Trent'
  end

  it 'should fetch weather data' do
    @forecast = Forecast.new Location.new latitude: 53, longitude: -2
    @forecast.fetch
    expect(@forecast.current).to include :summary
    expect(@forecast.current).to include :icon
    expect(@forecast.current).to include :temperature
  end
end
