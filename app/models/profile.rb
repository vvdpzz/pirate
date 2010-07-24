class Profile < ActiveRecord::Base
  belongs_to :user
  def check_phase(phase,delta)
    self.reputation += delta
    if self.reputation >= phase and self.reputation - delta < phase and delta > 0
      notification = "你的成长值超过#{phase},获得编辑权利"
      self.user.notifies.build(:body => notification, :attri => "reputation")
      self.user.save
    end
    if self.reputation <= phase and self.reputation - delta > phase and delta < 0
      notification = "你的成长值低于#{phase},失去编辑权利"
      self.user.notifies.build(:body => notification, :attri => "reputation")
      self.user.save
    end
    self.save
  end
end
