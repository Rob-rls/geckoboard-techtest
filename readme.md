# Introduction

This is a command line application that updates my Geckoboard Dashboard with current weather data for London from the [OpenWeatherMap API](http://openweathermap.org/api).  You can view the dashboard that this connects to here:  https://rsummersdev.geckoboard.com/dashboards/04B10317B887702D

I can envision a similar weather dashboard being used in places like a marina, yacht club or RNLI station or perhaps even small airports or by amateur pilots.  The dashboard not only shows the current situation, but also the trend, which could be very valuable information.

## Instructions

To install, please clone this repository on your computer and run the commands in your terminal.
```
$ git clone https://github.com/Rob-rls/geckoboard-techtest.git
$ cd geckoboard-techtest
$ bundle   
$ ruby app.rb
```
Note: If the bundler gem is not installed please run:  ```gem install bundler```

If API key is valid, you should then see a message in the command line informing the Geckoboard is updated and when the next update will occur.

Updates will occur every 5 minutes.  If you want to use a different frequency for updating, can you amend the UPDATE_INTERVAL in lib/timer.rb.

Type ```exit``` in the terminal to exit the program.

##  About this program

This program is developed entirely in Ruby. I chose ruby because I think Ruby’s class system lends to AGILE design.  This program can easily grow by adding additional classes to gather data from more than one source to upload to the dashboard.

The project is initialized in the app.rb file.  It creates 3 objects,  A GeckoboardRequest object, a WeatherData object and a Timer object.  Both the GeckoboardRequest and WeatherData objects are passed to the Timer object.

The WeatherData object, when it calls #send_weather_data method, pulls the current weather information for London from the API.  It then saves this information in an array and gives it a timestamp and returns it in a format compatible with the dataset.  The class is set store a limit of 100 records, which can be adjusted by changing the value of the constant.

The GeckoboardRequest object connects to the Geckoboard client and sets up or finds the dataset for ‘london.weather.’   When requested, it will take a set of data and push it up to the dashboard via the #update_data_set method.

The Timer object sets the interval that the updates happen.  It loops continuously, but pauses execution for 5 minutes (the default I built in).  While paused it will allow text input from the terminal to exit the program.  Otherwise it will keep calling GeckoboardRequest to update the dashboard.  I used the Thread class in ruby to be able to perform simultaneous functions (the menu option to exit, and running the update loop).


## Where to go from here

The program is rough around the edges.  Given more time, I would like to extract the setting up of the dataset into a separate class.  If this were done along with the formatting of the data from the WeatherData class, it would make it easier to update the fields and format of the data being sent.  I would also set up the timer class to utilize more than one class for collecting data, instead of just the weather class.

I’d like to give the user more options for customizing the data with a menu to select from.  For instance let the user input the frequency of the updates, as well as how many records they want to upload to the dashboard.  

Some additional features I have thought up are below:
* Persistence - save the data to a database, or even a csv file for exporting to spreadsheets
* Menu options for selecting location of the weather information or perhaps to create multiple updates for several cities to use on different dashboards
* Options to toggle updating the dashboard and/or the weather API.  The user might wish to keep getting the data updates from the Weather api saved to their database, but might want to 'turn-off' the dashbaord.  
* The weather API contains loads more data to integrate
