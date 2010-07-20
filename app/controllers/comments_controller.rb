class CommentsController < ApplicationController
	def create
		@commentable = params[:commentable].to_s.classify.constantize
		@qa = @commentable.find(params[:id])
		@comment = @qa.comments.build(:user_id  => current_user.id, :body => params[:body].to_s)
		@comment.save
		respond_to do |format|
		  format.js
	  end
	end
end