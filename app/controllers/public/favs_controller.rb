class Public::FavsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @user = post.user
    @fav = current_user.favs.new(post_id: post.id)
    if @fav.save
    # 通知機能
      # user_id = @fav.post.find_by
      # @user = User.find(user_id)
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
