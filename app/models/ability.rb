class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Car
    can [:update, :destroy], Car, driver: user
  end

end
