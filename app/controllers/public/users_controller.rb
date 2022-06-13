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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def quit
    @user = current_user
  end

  def out
    @user = current_user
    if @user.email == 'guest@example.com'
      reset_session
      redirect_to root_path
    else
    @user.update(is_deleted: "退会") #ここでis_deletedカラムの値を"退会"に更新
     reset_session
     redirect_to root_path
    end
  end

  def favs
    @user = User.find(params[:id])
    favs= Fav.where(user_id: @user.id).pluck(:post_id)
    @fav_posts = Post.find(favs)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :postal_code, :address, :telephone_number, :email, :profile_image)
  end

  def correct_user
    @user = current_user
    redirect_to user_path(@user) unless @user == current_user
  end

end
