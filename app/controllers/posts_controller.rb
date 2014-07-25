class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
	end
	def show
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
	end
	def  new
		@user = User.find(params[:user_id])
		@post = Post.new
	end
	def edit
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
	end
	def create
		user = User.find(params[:user_id])
 		post = Post.new(post_params)
 		post.user = user
		if post.save
			flash[:notice] = "Your post was created successfully."
			redirect_to user_posts_path user
		else
			flash[:alert] = "There was a problem saving your post."
			redirect_to new_user_post_path
	 	end
	end
	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			flash[:notice] = "Your post was edited successfully."
			redirect_to user_post_path post.user, post
		else
			flash[:alert] = "There was a problem editing your post."
			redirect_to edit_user_post_path post
		end
	end
	def destroy
		post = Post.find(params[:id])
		if post.delete
			flash[:notice] = "Your post with the title #{post.title} was deleted successfully."
			redirect_to user_posts_path post.user
		else
			flash[:alert] = "There was a problem saving your post."
			redirect_to user_posts_path post.user
	 	end
	end
	private
	def post_params
 		params.require(:post).permit(:title, :body)
	end
end
