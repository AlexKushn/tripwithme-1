class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'Driver'
      can [:read, :create], Car
      can [:update, :destroy], Car, driver: user
      can [:read, :create], Trip
      can [:update, :destroy], Trip
    end

    if user.role == 'Passenger'
      can [:read, :create], Comment
      can [:update, :destroy], Comment, author: user
      can [:read, :create], Trip
      can [:update, :destroy], Trip
    end

    if user.role == 'Admin'
      can :manage, :all
    end
      can [:read, :create], User
      can [:update, :destroy], User
  end
end
