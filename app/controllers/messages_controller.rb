class MessagesController < ApplicationController
  before_action :lookup_user
  before_action :lookup_chat

  private

  def lookup_user
    @user = User.find_by(mac_address: params[:mac_address])
  end

  def lookup_chat
    if(params[:chat_id])
      @chat = Chat.find(params[:chat_id])
    else
      # do something
    end
end
