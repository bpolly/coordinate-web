class ChatsController < ApplicationController
  before_action :lookup_user

  def create
    @chat = Chat.new
    @chat.user = @user
    @chat.distance_limit = params[:distance_limit] || 10 #default
    @chat.latitude = params[:latitude]
    @chat.longitude = params[:longitude]

    if @chat.save
      render :json => @chat
    else
      head 500
    end
  end

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end
end
