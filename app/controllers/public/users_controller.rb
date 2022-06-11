class Public::UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
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
