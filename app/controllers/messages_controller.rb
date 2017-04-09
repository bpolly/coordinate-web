class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :lookup_user, :except => [:index, :show]
  before_action :lookup_chat

  def index
    @messages = Message.all
  end

  def create
    return head(:forbidden) unless (@user.distance_from(@chat) <= 1)

    @message = @chat.messages.new
    @message.content = params[:content]
    @message.user = @user
    if @chat.save
      render :json => @chat.to_json( :include => [:messages] )
    else
      head 500
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end

  def lookup_chat
    @chat = Chat.find_or_create_by(id: params[:chat_id])
  end
end
