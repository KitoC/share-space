class UsersController < ApplicationController

  def index
    authorization("admin")
    @users = User.all
  end

  def admin
    authorization("admin")

  end

  def home
    @addresses = SharespaceVenue.last(5)
    @featured_ss = []
    @addresses.each do |ss|
      @featured_ss.push(ss.address)
    end
  end

  def profile
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @profile_photo = @user.photos.where(profile: true)
  end
end
