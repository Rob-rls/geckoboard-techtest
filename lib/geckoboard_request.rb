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
    @dataset = @client.datasets.find_or_create('londontemp.by_time', fields: [
            Geckoboard::DateTimeField.new(:timestamp, name: 'Time'),
            Geckoboard::NumberField.new(:temp, name: 'Temperature')
          ])
  end

end
