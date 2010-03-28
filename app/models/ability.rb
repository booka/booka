
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Project do |project|
      true
    end
  end
end