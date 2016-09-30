require 'weather_data'

describe WeatherData do

  context '#send_weather_data' do

    it 'returns a json format set of weather data' do
      weatherdata = WeatherData.new
      time_now = Time.now
      allow(DateTime).to receive(:now).and_return(time_now)
      allow(weatherdata).to receive(:get_current_temp).and_return(21)
      allow(weatherdata).to receive(:get_current_windspeed).and_return(10)
      allow(weatherdata).to receive(:get_current_winddirection).and_return(5)
      allow(weatherdata).to receive(:get_current_humidity).and_return(55)
      allow(weatherdata).to receive(:get_current_rainvolume).and_return(2)
      expect(weatherdata.send_weather_data).to eq([{timestamp: time_now,
                                                temp: 21,
                                                windspeed: 10,
                                                winddirection: 5,
                                                humidity: 55,
                                                rain: 2}])
    end

  end

end
