class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    followed_user = User.find(params[:user_id])
    current_user.follow(followed_user)
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
    @user = User.find(params[:user_id])
    @followings = @user.followings
    @followers = @user.followers
    @rooms = Room.where(host_id: current_user.id).or(Room.where(guest_id: current_user.id))
  end
end
