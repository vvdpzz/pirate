class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  def send_notification(object, attri, notification)
    object.user.notifies.build(:body => notification, :attri => attri)
    object.user.save
  end
  
  def increase_reputation(object)
    if object.class.name == "Question"
      object.user.profile.reputation += 5
    elsif object.class.name == "Answer"
      object.user.profile.reputation += 10
    end
    object.user.profile.save
  end
  
  def decrease_reputation(object)
    object.user.profile.reputation -= 2
    current_user.profile.reputation -= 1
    object.user.profile.save
    current_user.profile.save
  end
  
  def correct_reputation(object)
    if object.user != object.question.user
      object.user.profile.reputation += 15
      object.question.user.profile.reputation += 2
      object.user.profile.save
      object.question.user.profile.save
    end
  end
  
end
