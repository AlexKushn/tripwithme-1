class Ability
  include CanCan::Ability

  def initialize(user)
    #can [:read, :create], Car
    #can [:update, :destroy], Car, driver: user
    if user.role? :Admin
      can :manage, :all
    end

    if user.role? :Driver
      can [:read, :create], [Car, Trip, User]
      can [:update, :destroy], [Car, Trip, User]
    end

    if user.role? :Passenger
      can [:read, :create], [Comment, Trip, User]
      can [:update, :destroy], [Comment, Trip, User]
    end
  end
end
