class CommentsController < ApplicationController
	def create
		@blog = Blog.find comment_params[:blog_no]
		@blog.comments.create(comment_params)
    	redirect_to blog_path(@blog)
	end

	def comment_params
   		params.require(:comment).permit(:comment_text, :blog_no)
	end
end
