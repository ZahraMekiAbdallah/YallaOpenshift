class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    before_action :authenticate_user!

  protect_from_forgery
  
# def after_sign_in_path_for(resource_or_scope)
#     if resource.sign_in_count == 1
#        root_path
#     else
#        root_path
#     end
# end


end

# protect_from_forgery with: :exception
#   helper_method :current_user

#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end