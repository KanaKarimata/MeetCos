class Public::RelationshipsController < ApplicationController
  # before_action :set_q, only: [:friends, :search]

  # フォローするとき
  def create
    followed_user = User.find(params[:user_id])
    if current_user.follow(followed_user)
      Notification.create!(receiver_id: followed_user.id, sender_id: current_user.id, action: "Follow", action_id: current_user.follow(followed_user).id )
    end
    # @user = User.find(params[:relationship][:following_id])
    # @user.create_notification_follow!(current_user)
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    followed_user = User.find(params[:user_id])
    current_user.unfollow(followed_user)
    redirect_to request.referer
  end

  # フォロー一覧
  # フォロワー一覧
  def friends
    @user = current_user
    @followings = @user.followings
    @followers = @user.followers
    @rooms = @user.rooms
  end

end
