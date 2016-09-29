require 'open-uri'
require 'json'


class WeatherData

  API_URL = 'http://api.wunderground.com/api/fb3946a1b0abcf37/conditions/q/England/London.json'
  MAX_RECORDS = 100

  def initialize
    @api_url = API_URL
    @temp_history = []
  end

  def send_temp_data
    build_weather_record
    @temp_history.shift if @temp_history.length > MAX_RECORDS
    return @temp_history
  end

  private

  def get_current_temp
    open(@api_url) do |api_data|
      weather_conditions = JSON.parse(api_data.read)
      return weather_conditions['current_observation']['temp_f']
    end
  end

  def build_weather_record
    @temp_history.push({timestamp: DateTime.now, temp: get_current_temp})
  end

end
