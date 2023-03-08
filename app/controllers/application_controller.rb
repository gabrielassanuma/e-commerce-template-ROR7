class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :username, :address, :additional_info, :email, :password, :current_password) }
  end
end
