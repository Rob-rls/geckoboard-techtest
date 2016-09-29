require 'weather_data'

describe WeatherData do

  context '#send_temp_data' do

    it 'returns a json format set of temperatures' do
      weatherdata = WeatherData.new
      time_now = Time.now
      allow(weatherdata).to receive(:get_current_temp).and_return(21)
      allow(DateTime).to receive(:now).and_return(time_now)
      expect(weatherdata.send_temp_data).to eq([{timestamp: time_now, temp: 21}])
    end

  end

end
