class TagsController < ApplicationController
  def index
    @tags = Tag.paginate :page => params[:page]
    respond_to do |format|
      format.html
    end
  end

end
