class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email_address, :phone_number, :encrypted_password])
  end

  def after_sign_in_path_for(resource)
    current_shop_user
  end

  private
  def initialize_cart
    session[:cart] ||= []
  end


end
