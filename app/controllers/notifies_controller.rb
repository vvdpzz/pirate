class NotifiesController < ApplicationController
  def index
    @notifies = current_user.notifies.all
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @notify = current_user.notifies.find(params[:id])
    @notify.update_attributes(:status => 1)
    respond_to do |format|
      format.html
    end
  end

end
