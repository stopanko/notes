class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :password, :password_confirmation, :login, :full_name, :name, :birthday, :phone]
    devise_parameter_sanitizer.for(:account_update) << [:current_password, :password, :password_confirmation, :login, :full_name, :name, :birthday, :phone]
    devise_parameter_sanitizer.for(:sign_in) << [:email, :password]
  end
end
