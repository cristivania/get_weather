module PlacesHelper
  def get_weather(city_name)
   response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=#{unit == 'f' ? 'imperial' : 'metric'}&APPID=b6f22a31ed3c4519997f163e32c7a288")
   return response.parsed_response
 end
end
