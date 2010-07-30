class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_for(@qac)
		add_badge current_user, Badge.first.id
		notification = "#{current_user.email}投了你的正票"
		delta = 3000
		phase = 2000
		check_phase @qac, phase, delta
    send_notification @qac, "vote", notification
		respond_to do |format|
      format.js
    end
  end

  def vote_down
    @voteable = params[:voteable].to_s.classify.constantize
		@qac = @voteable.find(params[:id])
		current_user.vote_against(@qac)
		notification = "#{current_user.email}投了你的负票"
		delta = -3000
		phase = 2000
		check_phase @qac, phase, delta
    send_notification @qac, "vote", notification
		respond_to do |format|
      format.js
    end
  end

end
