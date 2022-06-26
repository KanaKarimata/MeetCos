class Public::PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  # before_action :set_q, only: [:index, :search]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    hashtag_list = params[:post][:hashname]
    if @post.save
      savepost_hashtags = Hashtag.create_if_nothing(hashtag_list)
      @post.save_hashtags(savepost_hashtags)
      # redirect_to user_path(current_user)
    end
    @posts = current_user.posts.with_attached_post_images.order(created_at: :desc)
    @comment_new = PostComment.new
  end

  def index
    @posts = Post.with_attached_post_images.order(created_at: :desc)
    @user = current_user
    @comment_new = PostComment.new
  end

  def feeds
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids ]).with_attached_post_images.order(created_at: :desc)
    
  end

  def update
    @post = Post.find(params[:id])
    hashtag_list = params[:post][:hashname]
    if @post.update(post_params)
      savepost_hashtags = Hashtag.create_if_nothing(hashtag_list)
      @post.save_hashtags(savepost_hashtags)
      # redirect_to user_path(current_user)
    end
    @posts = current_user.posts.with_attached_post_images.order(created_at: :desc)
    @comment_new = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    # redirect_to user_path(current_user)
    @posts = current_user.posts.with_attached_post_images.order(created_at: :desc)
    @comment_new = PostComment.new
  end

  private

  def post_params
    params.require(:post).permit(:caption, :user_id, post_images: [])
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(books_path) unless @user == current_user
  end

end
