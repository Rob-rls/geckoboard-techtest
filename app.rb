require_relative 'lib/geckoboard_request.rb'
require_relative 'lib/weather_data.rb'
require_relative 'lib/timer.rb'

geckoboard = GeckoboardRequest.new
weather = WeatherData.new
timer = Timer.new(weather, geckoboard)

timer.start_api_updates
