class Public::MessagesController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def create
    @message = current_user.messages.new(message_params)
    # render :validater unless @message.save
    redirect_back(fallback_location: root_url)
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
