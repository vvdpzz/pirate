class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		authorize! :vote_up, @qac
		if not @qac.voted_by?(current_user)
      current_user.vote_for @qac
      increase_reputation @qac
      send_notification @qac, "vote_up", current_user
      respond_to do |format|
        format.js
      end
    end
  end

  def vote_down
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		authorize! :vote_down, @qac
    if not @qac.voted_by?(current_user)
      current_user.vote_against @qac
      decrease_reputation @qac
      send_notification @qac, "vote_down", current_user
      respond_to do |format|
        format.js
      end
    end
  end

end
