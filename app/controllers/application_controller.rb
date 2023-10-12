class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name2, :last_name2, :birthday])
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'tetsu' && password == '0106'
  #   end
  # end
end
