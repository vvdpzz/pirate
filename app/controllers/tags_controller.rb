class TagsController < ApplicationController
  def index
    @tags = Tag.all
    respond_to do |format|
      format.html
    end
  end

end
