class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.profile.reputation >= 15
      can [:vote_up,:vote_down], :all
    end
    if user.profile.reputation >=1000
      can :update, :all
    end
  end 
end