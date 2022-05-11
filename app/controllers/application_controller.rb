class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(current_user)
    current_user.is_admin? ? admin_tests_path : tests_path
  end

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :login, :email, :password]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    # devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
