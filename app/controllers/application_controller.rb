class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      #devise_parameter_sanitizer.for(:sign_up) << [:name, :password_confirmation]
      #devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
    end
  end
