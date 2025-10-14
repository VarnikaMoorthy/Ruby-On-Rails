class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?

	# Return the currently logged in user (a hash stored in session) or nil
	def current_user
		users = session[:users] || []
		email = session[:current_user_email]
		return nil unless email
		users.find { |u| u['email'] == email }
	end

	def logged_in?
		!!current_user
	end

	# Simple before_action to require login for controllers/actions that need it
	def require_login
		return if logged_in?
		redirect_to login_path, alert: 'Please log in'
	end
end
