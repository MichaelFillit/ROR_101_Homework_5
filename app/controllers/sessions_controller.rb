class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.where(:email => params[:email]).first
		puts user.email
		puts user.password
		puts params[:email]
		puts params[:password]
		if user && user.password == params[:password]
			session[:user_id] = user.id
			return redirect_to '/users'
		end
		redirect_to '/login'
	end
	def destroy
		session[:user_id] = nil
		return redirect_to '/login'
	end
end