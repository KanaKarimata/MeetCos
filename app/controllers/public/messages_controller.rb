class Public::MessagesController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def create
    @message = current_user.messages.new(message_params)
    room = Room.find(params[:room_id])
    @message.room = room
    @user = User.find(params[:user_id])
    if message.save
      # 通知機能
      Notification.create!(receiver_id: @user.id, model_name: "Message", model_id: @message.id)
    end
    redirect_to room_path(room)
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to posts_path
    end
  end

end
