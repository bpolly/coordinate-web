class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :lookup_user

  def update_location
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]

    if @user.save
      render :json => @user
    else
      head 500
    end
  end

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end

end
