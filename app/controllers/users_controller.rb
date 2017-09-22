class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
      		if @user.save
				format.html { redirect_to blogs_path, :flash => { :alert => "successfully" }}
			else
				format.html { render 'new' }
			end
		end
	end

	def user_params
   		params.require(:user).permit(:name, :contact, :address)
	end

	def index
		@userAll = User.all
		if((params[:user])=="")
			redirect_to blogs_path
		else
			@user = User.find(params[:user])
			@blog = @user.blogs
		end
	end

end
