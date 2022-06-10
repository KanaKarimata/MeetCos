class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def top
    @user = current_user
  end

  def about
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :postal_code, :address, :telephone_number, :is_deleted])
  end
end
