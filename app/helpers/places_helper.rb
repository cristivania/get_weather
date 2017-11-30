module PlacesHelper
  def get_weather(place)
   response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=imperial&appid=#{ENV['OPENWEATHER_KEY']}")
   return response.parsed_response
 end
end
