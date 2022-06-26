class Public::FavsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    @current_user = current_user
    @user = post.user
    @fav = current_user.favs.new(post_id: post.id)
    if @fav.save
    # 通知機能
      Notification.create!(receiver_id: @user.id, sender_id: current_user.id, action: "Fav", action_id: @fav.id)
    end

    render 'replace_btn'
  end

  def destroy
    post = Post.find(params[:post_id])
    @fav = current_user.favs.find_by(post_id: post.id)
    @fav.destroy
    render 'replace_btn'
  end
end
