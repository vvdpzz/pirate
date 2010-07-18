class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :update, :all, :user_id => 1
  end
end