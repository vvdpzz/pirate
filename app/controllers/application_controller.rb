class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  # rescue_from ActiveRecord::RecordNotUnique do |expection|
  #   redirect_to root_url
  # end
end
