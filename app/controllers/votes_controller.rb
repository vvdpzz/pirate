class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_for(@qac)
  end

  def vote_down
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_against(@qac)
  end

end
