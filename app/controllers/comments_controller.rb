class CommentsController < ApplicationController
  def new
    # link_to pass one or two args, and question is absolutly passed
    @able = Question.find(params[:question_id])
    if params[:answer_id]
      @able = Answer.find(params[:answer_id])
    end
    respond_to do |format|
		  format.js
	  end
  end
	def create
		@commentable = params[:commentable].to_s.classify.constantize
		@qa = @commentable.find(params[:id])
    @comment = @qa.comments.build(:user_id  => current_user.id, :body => params[:body].to_s)
    @comment.save

    send_notification @comment, "comment", comment.user
		respond_to do |format|
		  format.js
	  end
	end
end