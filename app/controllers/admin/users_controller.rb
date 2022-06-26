class Admin::UsersController < ApplicationController
  
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: "退会") #ここでis_deletedカラムの値を"退会"に更新
     reset_session
     redirect_to root_path
  end
end
