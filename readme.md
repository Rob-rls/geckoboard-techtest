# Introduction

This is a little command line app that updates my Geckoboard Dashboard with current temperature data for London from the [OpenWeatherMap API](http://openweathermap.org/api).  You can view the dashboard that this connects to here:  https://rsummersdev.geckoboard.com/dashboards/04B10317B887702D

## Instructions
```
$ git clone
$ cd geckoboard-techtest
$ bundle   
$ ruby app.rb
```
Note: If the bundler gem is not installed please run:  ```gem install bundler```

If API key is valid, you should then see a message in the command line informing the Geckoboard is updated and when the next update will occur.

Updates will occur every 5 minutes.  If you want to use a different frequency for updating, can you amend the UPDATE_INTERVAL in lib/timer.rb.

Type exit in the terminal to exit the program.

##  About this program

This program is developed entirely in Ruby. I chose ruby because I think Ruby’s class system lends to AGILE design.  This program can easily grow by adding additional classes to gather data from more than one source to upload to the dashboard.

The project is initialized in the app.rb file.  It creates 3 objects,  A GeckoboardRequest object, a WeatherData object and a Timer object.  Both the GeckoboardRequest and WeatherData objects are passed to the Timer object.

The WeatherData object, when it calls #send_temp_data method, pulls the current temperature for London from the API.  It then saves this information in an array and gives it a timestamp and returns it in a format compatible with the dataset.

The GeckoboardRequest object connects to the Geckoboard client and sets up or finds the dataset for ‘londontemp.by_time.’  When requested, it will take a set of data and push it up to the dashboard via the #update_data_set method.

The Timer object sets the interval that the updates happen.  It loops continuously, but pauses execution for 5 minutes (the default built in).  while paused it will allow text input from the terminal to exit the program.  Otherwise it will keep calling GeckoboardRequest to update the dashboard.


## Where to go from here
I’d like to give the user more options for customizing the data with a menu to select from.  For instance let the user input the frequency of the updates, as well as how many records they want to upload to the dashboard.

The weather API contains loads of data.  The next step would be integrating more data (like humidity, precipitation, wind, etc.) into the dataset to display on the dashboard.  
