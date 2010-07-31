class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.profile.reputation >= 15
      can :vote_up, :all
    end
    if user.profile.reputation >= 100
      can :vote_down, :all
    end
    if user.profile.reputation >= 50
      can [:new, :create], :all
    end
    if user.profile.reputation >=2000
      can :update, :all
    end
  end 
end