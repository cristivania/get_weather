class FavoriteCitiesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    @place = current_user.favorite_cities.build(favorite_params)
    if @favorite.save
      redirect_to dashboard_path, notice: 'City saved'
    else
      render :new
    end
  end

  def show
    @place = current_user.favorite_cities.find(params[:id])
    @unit = params[:unit].present? ? params[:unit] : 'C'
    @current_weather = WeatherApi.get_weather(@place.city_name, @unit)
  end

  def destroy
    @place = current_user.favorite_cities.find(params[:id])
    @place.destroy!
    redirect_to dashboard_path, notice: "Favorite city deleted"
  end

  private
  def favorite_params
    params.require(:favorite_city).permit(:city_name, :user_id)
  end
end
