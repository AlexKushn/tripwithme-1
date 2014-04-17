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
        can [:read], Trip do |tr|
          tr.users.find user.id rescue false
        end
        can [:read, :create, :update, :destroy], Trip, :id => user.id
        can [:read, :create], User
        can [:update, :destroy], User, :id => user.id
      when 'Passenger'
        can [:read, :create], Comment
        can [:update, :destroy], Comment, author: user
        can [:read], Trip do |tr|
          tr.users.find user.id rescue false
        end
        can [:read], Trip
        can [:read, :create], User
        can [:update, :destroy], User, :id => user.id
      else
        can :read, :all
        can :create, User
        can [:update, :destroy], User, :id => user.id

      end
  end
end

