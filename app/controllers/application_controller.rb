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
  
  def check_phase(object, phase, delta)
    object.user.profile.reputation += delta
    object.user.profile.save
    if object.user.profile.reputation >= phase and object.user.profile.reputation - delta < phase and delta > 0
      notification = "你的成长值超过#{phase},获得编辑权利"
      object.user.notifies.build(:body => notification, :attri => "reputation")
      object.user.save
    end
    if object.user.profile.reputation <= phase and object.user.profile.reputation - delta > phase and delta < 0
      notification = "你的成长值低于#{phase},失去编辑权利"
      object.user.notifies.build(:body => notification, :attri => "reputation")
      object.user.save
    end
    object.save
  end
  
  def add_badge(user, badge_id)
    exist = user.badgings.find_by_badge_id(badge_id)
    if exist
      exist.times +=1
      exist.save
    else
      new_badge = user.badgings.build(:badge_id => badge_id)
		  new_badge.save
		end
  end
end
