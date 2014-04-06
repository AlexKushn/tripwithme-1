class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "driver"
      can [:read, :create], Car
      can [:update], Car, driver: user
      can [:read, :create], Comment
      can [:update], Comment, author: user
      can [:read, :create], [User, Trip]
      can [:update], [User, Trip,], user
    elsif user.role == "passenger"
      can [:read, :create], Comment
      can [:update], Comment, author: user
      can [:read, :create], [User, Trip]
      can [:update], [User, Trip,], user
    else
      can :index, :all
    end
  end
end
