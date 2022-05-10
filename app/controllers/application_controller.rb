class ApplicationController < ActionController::Base
  def after_sign_in_path_for(current_user)
    current_user.is_admin? ? admin_tests_path : tests_path
  end
end
