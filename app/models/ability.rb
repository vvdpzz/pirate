class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.profile.reputation >= 1000
      can :update, :all
    end
  end
end