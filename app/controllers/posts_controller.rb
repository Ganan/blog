class PostsController < ApplicationController

	http_basic_authenticate_with name: "ganan", password: "Cho13561356", except: [:index, :show]

	def new 
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def create
		@post = Post.new( user_params )
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.


	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update( user_params )
			redirect_to @post
		else 
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end



	private
=begin
	def post_params
		params.require(:post).permit(:title, :text)
	end
=end
	def user_params
		params.require(:post).permit(:title, :text, :tags_attributes, :image)
	end

end