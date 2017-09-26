class BlogsController < ApplicationController
	#before_action :authenticate_user!
	#protect_from_forgery
  #before_filter :current_user
  	
	def index
		
		@user = User.all
		if params[:user] == "" || params[:user].nil?
			@blogs = Blog.all
		else
			@user_id = User.find(params[:user])
			@blogs = @user_id.blogs
		end
	end

	def show
		@blog = Blog.find(params[:id])
		 @comment = Comment.new
		 @comments = @blog.comments
		 @user = User.find_by_id(@blog)
		if current_user.nil?
		 @user_id = 0;
		else
		 @user_id = current_user.id
		end
	end

	def new
		 @blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		respond_to do |format|
			if @blog.save
				format.html { redirect_to blogs_path }
				#format.html { redirect_to blogs_path, :flash => { :alert => "successfully" }}
			else
				@users = User.all
				format.html { render 'new' }
				# format.html { redirect_to new_blog_path, :flash => { :alert => @blog.errors.full_messages.to_sentence } }
			end
		end
	end

	def destroy
		Blog.find(params[:id]).destroy
		redirect_to blogs_path
	end

	def blog_params
			params.require(:blog).permit(:title, :description, :user_id)
	end

	def sample
		@blog1 = Blog.find(6)
		@blog2 = Blog.take(3)
		@blog3 = Blog.find([5,7])
		@blog4 = Blog.first
		@blog5 = Blog.last
		@blog6 = Blog.order(:title)
		@blog7 = Blog.order(title: :DESC)
		@blog8 = Blog.find_by title:'Bonorum et Malorum'
		@blog9 = Blog.where(id:5)
		@blog10 = Blog.where(id:'6')
		@blog11 = Blog.where("title = ?", 'Bonorum et Malorum')
		@blog12 = Blog.where("id = ? AND title = ?", 6,'Bonorum et Malorum')
		@blog13 = Blog.where("id = ? OR title = ?", 5,'Bonorum et Malorum')
		@blog14 = Blog.select(:title)
		@blog15 = Blog.select(:title).where(id:6)
		@blog16 = Blog.select(:title).where(id:6).only(:title)
		@blog17 = Blog.all.reverse_order

	end
end
