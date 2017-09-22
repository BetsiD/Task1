class CommentsController < ApplicationController
	def create
		@blog = Blog.find comment_params[:blog_id]
    	respond_to do |format|
			if @blog.comments.create(comment_params)
				format.html { redirect_to blog_path(@blog)}
			else
				format.html { redirect_to blog_path(@blog), :flash => { :alert => @blog.errors.full_messages.to_sentence } }
			end
		end
	end

	def comment_params
   		params.require(:comment).permit(:comment_text, :blog_id)
	end
end
