class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    @messages = @channel.messages.order('created_at ASC').map do |message|
      {
        id: message.id,
        author: message.user.nickname,
        content: message.content,
        created_at: message.created_at
      }
    end
    render json: @messages
  end

  def create
    @message = Message.create(content:params[:content], user: current_user, channel: @channel)
    render json: {
      id: @message.id,
      author: @message.user.nickname,
      content: @message.content,
      created_at: @message.created_at
    }
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end

