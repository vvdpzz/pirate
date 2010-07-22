class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_for(@qac)
		respond_to do |format|
      format.js
    end
  end

  def vote_down
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_against(@qac)
		respond_to do |format|
      format.js
    end
  end

end
