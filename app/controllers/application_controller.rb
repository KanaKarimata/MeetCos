class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if user_signed_in?
      user_path(resource)
    end
  end


  def after_sign_in_path_for(resource)
    pp "きた？"
    admin_posts_path
  end

  protected


  def configure_permitted_parameters
    pp "hoge"
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :userid, :is_deleted])
  end

end
