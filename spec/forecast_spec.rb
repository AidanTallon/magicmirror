describe Forecast do
  let(:forecast) { @forecast = Forecast.new latitude: 53, longitude: -2, api_key: ENV['FORECAST_IO_API_KEY'] }

    it 'should initialize given latitude and longitude' do
      expect(forecast.latitude).to eq 53
      expect(forecast.longitude).to eq -2
      expect(forecast.api_key).to eq ENV['FORECAST_IO_API_KEY']
    end

    it 'should fetch weather data' do
      forecast.fetch
      expect(forecast.current[:summary]).not_to eq nil
      expect(forecast.current[:icon]).not_to eq nil
      expect(forecast.current[:temperature]).not_to eq nil
    end

    it 'should return nil values with incorrect api key' do
      invalid_forecast = Forecast.new latitude: 53, longitude: -2, api_key: 12
      invalid_forecast.fetch
      expect(invalid_forecast.current[:summary]).to eq nil
      expect(invalid_forecast.current[:icon]).to eq nil
      expect(invalid_forecast.current[:temperature]).to eq nil
    end
end
