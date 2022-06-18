class Public::MessagesController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def create
    @message = current_user.messages.new(message_params)
    room = Room.find(params[:room_id])
    @message.room = room
    if @message.save
      # 通知機能
      user_id = (current_user.id == room.host_id)? room.guest_id : room.host_id
      @user = User.find(user_id)
      Notification.create!(receiver_id: @user.id, sender_id: current_user.id, action: "Message", action_id: @message.id)
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
