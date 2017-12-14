module PlacesHelper
  include HTTParty
  def get_weather(city_name)
    url = ("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=imperial&APPID=b6f22a31ed3c4519997f163e32c7a288")
    @response = HTTParty.get(url)
    weather_conditions= @response.body
    return JSON.parse(weather_conditions)
  end
end
