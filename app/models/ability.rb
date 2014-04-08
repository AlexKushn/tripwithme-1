class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Car
    can [:update, :destroy], Car, driver: user
      if user.admin?
      can :manage, :all
      end
  end
end
