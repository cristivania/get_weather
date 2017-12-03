class PlacesController < ApplicationController


  def index
    @place = Place.new
  end


  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save!
      redirect_to user_place_path(current_user.id, @place), notice: 'Favorite city saved'
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

  private
   # Use callbacks to share common setup or constraints between actions.
   def set_place
     @place = Place.find(params[:id])
   end

   def current_user
     @current_user = User.find(params[:user_id])
   end
   # Never trust parameters from the scary internet, only allow the white list through.
   def place_params
     params.require(:place).permit(:city_name, :user_id)
   end
end
