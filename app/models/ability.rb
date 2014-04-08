class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Car
    can [:update, :destroy], Car, driver: user
    can [:read, :create, :update], :all

  end
end
