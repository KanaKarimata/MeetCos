class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  def top
    @user = current_user
  end

  def about
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :userid, :is_deleted])
  end
end
