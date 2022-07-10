class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    hashtag_list = params[:post][:hashname]
    if @post.save
      savepost_hashtags = Hashtag.create_if_nothing(hashtag_list)
      @post.save_hashtags(savepost_hashtags)

      tags = @post.post_images.map {|image| Vision.get_image_data(image)}.flatten
      # tags = [ ]
      # @post.post_images.each {|image| tags << Vision.get_image_data(image)}
      # tags.flatten.each
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
    else
      redirect_to user_path(current_user)
      flash[:post_alert] = "画像の拡張子はjpg, jpeg, pngのみ投稿できます。投稿できる画像は１０枚までです。投稿にはCaptionが必ず必要です"
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
    @comment_new = PostComment.new
  end

  def update
    @post = Post.find(params[:id])
    hashtag_list = params[:post][:hashname]
    if @post.update(post_params)
      savepost_hashtags = Hashtag.create_if_nothing(hashtag_list)
      @post.save_hashtags(savepost_hashtags)

      tags = @post.post_images.map {|image| Vision.get_image_data(image)}.flatten
      tags.each do |tag|
        @post.tags.update(name: tag)
      end
    else
      redirect_to user_path(current_user)
      flash[:post_alert] = "画像の拡張子はjpg, jpeg, pngのみ投稿できます。投稿できる画像は１０枚までです。投稿にはCaptionが必ず必要です"
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
