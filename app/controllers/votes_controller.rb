class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		authorize! :vote_up, @qac
		if not @qac.voted_by?(current_user)
      current_user.vote_for @qac
      
      set_vote(@qac)
      
      increase_reputation @qac
      if @qac.class.name == 'Question'
        notification = "#{current_user.id}投了您正票#{@qac.class.name}_#{@qac.commentable.id}"
      else
        notification = "#{current_user.id}投了您正票#{@qac.class.name}_#{@qac.commentable.id}"
      end
      send_notification @qac, "vote_up", notification
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
      
      set_vote(@qac)
      
      decrease_reputation @qac
      if @qac.class.name == 'Question'
        notification = "#{current_user.id}投了您负票#{@qac.class.name}_#{@qac.commentable.id}"
      else
        notification = "#{current_user.id}投了您负票#{@qac.class.name}_#{@qac.commentable.id}"
      end
      send_notification @qac, "vote_down", notification
      respond_to do |format|
        format.js
      end
    end
  end

end
