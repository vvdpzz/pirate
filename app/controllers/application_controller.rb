class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  # rescue_from ActiveRecord::RecordNotUnique do |expection|
  #   redirect_to root_url
  # end
  def send_notification(object, attri, notification)
    object.user.notifies.build(:body => notification, :attri => attri)
    object.user.save
  end
end
