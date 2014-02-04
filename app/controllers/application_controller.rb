class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end

	#this is in the application_controller because it should be available to all views,
	#not just views for a specific model.

	# if session[:user_id] == true
	# 	@current_user ||= User.find(session[:user_id])
	# 	if @current_user == nil
	# 		@current_user = User.find(session[:user_id])
	# 	else
	# 		@current_user
	# 	end
	# end