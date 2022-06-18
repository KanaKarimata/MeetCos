class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    pp "ここ", user_signed_in?, admin_signed_in?
    if user_signed_in?
      user_path(resource)
    else if admin_signed_in?
      admin_posts_path
    end
    end
  end

  protected

  def after_sign_in_path_for(resource)
    pp "きた？"
    admin_posts_path
  end

  def configure_permitted_parameters
    pp "hoge"
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :postal_code, :address, :telephone_number, :is_deleted])
    
  end

end
