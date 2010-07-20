class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.profile.reputation >= 1000
      can :edit, :all
    end
  end
end