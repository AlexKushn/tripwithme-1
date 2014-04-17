class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    case user.role
      when 'Admin'
      can :manage, :all
      when 'Driver'
        can [:read, :create], Car
        can [:update, :destroy], Car, driver: user
        can [:read, :create], Trip
        can [:update, :destroy], Trip
        can [:read, :create], User
        can [:update, :destroy], User
      when 'Passenger'
        can [:read, :create], Comment
        can [:update, :destroy], Comment, author: user
        can [:read], Trip
        can [:read, :create], User
        can [:update, :destroy], User
      else
        can :read, :all
    end
  end
end

