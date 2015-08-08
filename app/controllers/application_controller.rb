class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
    
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
    
    devise_parameter_sanitizer.for(:sign_up) << :about
    devise_parameter_sanitizer.for(:account_update) << :about
    
    devise_parameter_sanitizer.for(:sign_up) << :website
    devise_parameter_sanitizer.for(:account_update) << :website
    
    devise_parameter_sanitizer.for(:sign_up) << :twitter
    devise_parameter_sanitizer.for(:account_update) << :twitter
    
    devise_parameter_sanitizer.for(:sign_up) << :facebook
    devise_parameter_sanitizer.for(:account_update) << :facebook
  end
end
