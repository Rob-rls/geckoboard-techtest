class Timer

  UPDATE_INTERVAL = 300 #Time in seconds between API updates

  def initialize(weather, geckoboard)
    @weather = weather
    @geckoboard = geckoboard
  end

  def start_api_updates
    Thread.start { exit_command }
    begin_api_update_loop
  end

  private

  def exit_command
    while exit_condition?
      puts "Invalid command"
    end
    abort "Exiting the program"
  end

  def exit_condition?
    gets.strip !~ /^exit$/i
  end

  def begin_api_update_loop
    loop do
      update_geckoboard
      next_update_message
      sleep UPDATE_INTERVAL
    end
  end

  def update_geckoboard
    @geckoboard.update_dataset(@weather.send_temp_data)
    puts "Geckoboard updated"
  end

  def next_update_message
    time = Time.now + UPDATE_INTERVAL
    puts "The data will next update at #{time.strftime("%H:%M")}"
    puts "Type exit to exit this program:"
  end

end
