class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    respond_to do |format|
      format.html
    end
  end

end
