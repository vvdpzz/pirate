class PreviewsController < ApplicationController
  def index
    @term = RedCloth.new(params[:term].to_s).to_html
    respond_to do |format|
      format.html
    end
  end
end
