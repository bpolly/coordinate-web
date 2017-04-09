class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :lookup_user, :except => [:index]

  def index
    @users = User.all
    render :json => @users
  end

  def update_location
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]

    if @user.save
      render :json => @user
    else
      head 500
    end
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end

end
