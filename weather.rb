require 'http'

while true
  p "Choose a city, and I will give you the current forecast. Type 'stop' to end."

  city = gets.chomp

  if city.downcase == "stop"
    break
  end

  p "What is your preferred temperature unit:(Celcius or Farenheit)"

  pref_temp_unit = gets.chomp

  if pref_temp_unit.downcase == "celcius"
    pref_temp_unit = "metric"
  elsif pref_temp_unit.downcase == "farenheit"
    pref_temp_unit = "imperial"
  end

  response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=#{pref_temp_unit}")

  temp_min = response.parse(:json)["main"]["temp_min"]
  temp_max = response.parse(:json)["main"]["temp_max"]
  wind_speed = response.parse(:json)["wind"]["speed"]

  p "The curent weather forecast in #{city} is as follows: temperature min = #{temp_min}, temperature max = #{temp_max}, wind speed = #{wind_speed}"
end
