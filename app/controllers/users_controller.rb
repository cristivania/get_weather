class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new allowed_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_places_path(@user), notice: 'Created user'
    else
      flash[:notice] = "Please check that your passwords match."
      render :new
    end
  end

  private
  def allowed_params
    params.require(:user).permit(:first_name, :email, :password, :password_digest, :password_confirmation)
  end
end
