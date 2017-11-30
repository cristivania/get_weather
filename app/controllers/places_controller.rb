class PlacesController < ApplicationController


  def index
    @place = Place.new
  end


  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to user_place_path , notice: 'City saved'
    else
      render :new
    end
  end

  def show
    @place = current_user.places.find(params[:id])
    @unit = params[:unit].present? ? params[:unit] : 'C'
    @current_weather = WeatherApi.get_weather(@place.city_name, @unit)
  end

  def destroy
    @place = current_user.favorite_cities.find(params[:id])
    @place.destroy!
    redirect_to dashboard_path, notice: "Favorite city deleted"
  end

  private
  def place_params
    params.require(:place).permit(:city_name, :user_id)
  end
end
