require 'geckoboard'
require 'date'

class GeckoboardRequest

  def initialize
    @client = Geckoboard.client('e70c81cd6610f867dd72bcc56d8b1b47')
    check_api_key
    load_dataset
  end

  def update_dataset(weather_data)
    @dataset.put(weather_data)
  end

  private

  def check_api_key
    puts "API Key is Valid" if @client.ping
  end

  def load_dataset
    @dataset = @client.datasets.find_or_create('london.weather', fields: [
            Geckoboard::DateTimeField.new(:timestamp, name: 'Time'),
            Geckoboard::NumberField.new(:temp, name: 'Temperature'),
            Geckoboard::NumberField.new(:windspeed, name: 'Wind Speed'),
            Geckoboard::NumberField.new(:winddirection, name: 'Wind Direction'),
            Geckoboard::PercentageField.new(:humidity, name: 'Humidity'),
            Geckoboard::NumberField.new(:rain, name: 'Rain Volume')
          ])
  end

end
