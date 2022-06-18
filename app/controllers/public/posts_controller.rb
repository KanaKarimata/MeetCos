class Public::PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_search

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #p @post.valid?
    #p @post.errors.full_messages

    # p post_params[:hashbody]
    # p post_params

    # ActiveRecord::Base.transaction do
    #   @post.save
    #   hashtags = Hashtag.create_if_nothing(post_params[:hashbody])

    #   @post.hashtags = hashtags
      @post.save!
    # end

    redirect_to user_path(current_user)
  end

  def index
    @posts = Post.all
    @user = current_user
    @q = Post.ransack(params[:q])
    @result_posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @comment_new = PostComment.new
    @comments = @post.post_comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  def hashtag
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    else
      name = params[:name]
      name = name.downcase
      @hashtag = Hashtag.find_by(hash: name)
      @post = @hashtag.posts
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    end
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

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

end
