class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :lookup_user
  before_action :lookup_chat

  private

  def lookup_user
    @user = User.find_or_create_by(mac_address: params[:mac_address])
  end

  def lookup_chat
    @chat = Chat.find_or_create_by(id: params[:chat_id])
  end
end
