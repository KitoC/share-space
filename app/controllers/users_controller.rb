class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @profile_photo = @user.photos.where(profile: true)
  end
end
