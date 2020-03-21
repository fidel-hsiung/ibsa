class ApplicationController < ActionController::Base
	helper_method :current_user

	before_action :authenticated_user!

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			@current_user = nil
		end
	end

	protected

	def authenticated_user!
		return if current_user
		flash[:notice] = 'Please login first!'
		redirect_to login_path
	end
end
