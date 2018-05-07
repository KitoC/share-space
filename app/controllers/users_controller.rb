class UsersController < ApplicationController

  def index
    authorization("admin")
    @users = User.all
  end

  def admin
    authorization("admin")
    
  end

  def profile
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @profile_photo = @user.photos.where(profile: true)
  end
end
