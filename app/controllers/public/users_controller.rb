class Public::UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
  end

  private

  def correct_user
    @user = current_user
    redirect_to user_path(@user) unless @user == current_user
  end

end
