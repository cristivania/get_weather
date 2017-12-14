class PlacesController < ApplicationController


  def index

  end


  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save!
      redirect_to dashboard_path, notice: 'City Saved'
    else
      render :new
    end
  end

  def show
    @place = current_user.places.find(params[:id])

  end

  def destroy
    @place = current_user.places.find(params[:id])
    @place.destroy!
    redirect_to dashboard_path, notice: "Favorite city deleted"
  end

  private
  def place_params
    params.require(:place).permit(:city_name, :user_id)
  end

end
