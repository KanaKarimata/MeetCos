class Public::FavsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @fav = current_user.favs.new(post_id: post.id)
    @fav.save
    post.create_notification_fav!(current_user)
    render 'replace_btn'
  end

  def destroy
    post = Post.find(params[:post_id])
    @fav = current_user.favs.find_by(post_id: post.id)
    @fav.destroy
    render 'replace_btn'
  end
end
