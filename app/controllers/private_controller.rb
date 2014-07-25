class PrivateController < ApplicationController

	before_action :require_login

	def require_login
		if session[:user_id].nil?
			return redirect_to '/login'
		end
		@user = User.find(session[:user_id])
		unless @user
			redirect_to '/login'
		end
	end
end