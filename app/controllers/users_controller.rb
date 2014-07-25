class UsersController < PrivateController
	skip_before_action :require_login, only: [:new, :create]
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def  new
		@user = User.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		if user.update(user_params)
			flash[:notice] = "Your account was edited successfully."
			redirect_to(user_path(user))
		else
			flash[:alert] = "There was a problem editing your account."
			redirect_to(edit_user_path(user))
		end
	end
	def create
 		user = User.new(user_params)
		if user.save
			flash[:notice] = "Your account was created successfully."
			redirect_to user_path user
		else
			flash[:alert] = "There was a problem saving your account."
			redirect_to new_user_path
	 	end
	end
	def destroy
		user = User.find(params[:id])
		if user.delete
			flash[:notice] = "Your account was deleted successfully."
			redirect_to users_path
		else
			flash[:alert] = "There was a problem saving your account."
			redirect_to user_path user
	 	end
	end
	private
	def user_params
 		params.require(:user).permit(:fname, :lname, :email, :password)
	end
end