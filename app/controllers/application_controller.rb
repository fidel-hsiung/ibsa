class ApplicationController < ActionController::Base
	helper_method :current_user

	before_action :authenticated_user!

	def current_user
		return nil unless session[:user_id]
		return @current_user if @current_user.present?
		if (user = User.find_by(id: session[:user_id]))
			@current_user = user
		else
			session[:user_id] = nil
		end
		@current_user
	end

	protected

	def authenticated_user!
		return if current_user
		flash[:notice] = 'Please login first!'
		redirect_to login_path
	end
end
