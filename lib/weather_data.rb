require 'open-uri'
require 'json'


class WeatherData

  API_URL = 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=b92d678b77f2277c5fff2ba0c83be2d3&units=metric'
  MAX_RECORDS = 100

  def initialize
    @api_url = API_URL
    @temp_history = []
  end

  def send_weather_data
    build_weather_record
    @temp_history.shift if @temp_history.length > MAX_RECORDS
    return @temp_history
  end

  private

  def get_weather_data_json
    open(@api_url) do |api_data|
      return JSON.parse(api_data.read)
    end
  end

  def get_current_temp(weather_data)
    temp = weather_data['main']['temp']
    return temp ||= 0 # if not measured, converts nil to 0
  end

  def get_current_windspeed(weather_data)
    windspeed = weather_data['wind']['speed']
    return windspeed ||= 0 # if not measured, converts nil to 0
  end

  def get_current_winddirection(weather_data)
    winddirection = weather_data['wind']['deg']
    return winddirection ||= 0 # if not measured, converts nil to 0
  end

  def get_current_humidity(weather_data)
    humidity = (weather_data['main']['humidity']).to_f/100
    return humidity ||= 0 # if not measured, converts nil to 0
  end

  def get_current_rainvolume(weather_data)
    rain = weather_data['rain']['3h']
    return rain ||= 0 #if no rain, converts nil to 0
  end

  def build_weather_record
    weather_data = get_weather_data_json
    @temp_history.push({timestamp: DateTime.now,
                        temp: get_current_temp(weather_data),
                        windspeed: get_current_windspeed(weather_data),
                        winddirection: get_current_winddirection(weather_data),
                        humidity: get_current_humidity(weather_data),
                        rain: get_current_rainvolume(weather_data)
                        })
  end

end
