class Public::UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
    @main_categories = Post.pluck(:main_category)
    @sub_categories = Post.pluck(:sub_category)
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
  end

  def sub_categories
    @sub_categories = SubCategory.where(
      main_category_id: params[:main_category_id]
    )
  end

end
