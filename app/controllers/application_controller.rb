class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # strong parameters check if using devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  	def configure_permitted_parameters
  		# new hash elements that can be passed as params
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  	end
end
