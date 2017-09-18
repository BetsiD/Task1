class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def show
		 @blog = Blog.find(params[:id])
		 @comment = Comment.new
		 @comments = @blog.comments
	end

	def new
		 @blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
	
   		@blog.save
      		redirect_to :action => 'index'
	end

	def destroy
		Blog.find(params[:id]).destroy
		redirect_to :action => 'index'
	end

	def blog_params
   		params.require(:blog).permit(:title, :description, :author)
	end
end
