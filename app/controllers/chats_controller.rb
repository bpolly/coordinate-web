class ChatsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :lookup_user

  def get_chats
    @chats = Chat.all
    @chats = Chat.near(@user.location, 1)
    render :json => @chats.to_json( :include => [:messages] )
  end

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

  def show
    @chat = Chat.find(params[:id])
    render :json => @chat.to_json( :include => [:messages] )
  end

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end
end
