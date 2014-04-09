class Ability
  include CanCan::Ability

  def initialize(user)
    #can [:read, :create], Car
    #can [:update, :destroy], Car, driver: user
    can :manage, :all
  end
end
