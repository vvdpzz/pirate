class FavouritesController < ApplicationController
  def create
    favourite = current_user.favourites.find_by_question_id(params[:question_id])
    if favourite
      favourite.destroy
      @favourite = false
    else
      current_user.favourites.build(:question_id => params[:question_id])
      current_user.save
      @favourite = true
    end
    respond_to do |format|
      format.js
    end
  end
end
