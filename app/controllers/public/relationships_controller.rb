class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  #
  # def followings
  #   user = User.find(params[:user_id])
  #   @users = user.followings
  # end
  #
  # def followers
  #   user = User.find(params[:user_id])
  #   @users = user.followers
  # end

  # フォロー一覧
  # フォロワー一覧
  def friends
    @user = User.find(params[:user_id])
    @followings = @user.followings
    @followers = @user.followers
  end
end
