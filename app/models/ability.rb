
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Project do |project|
      !user.nil?
    end

    can :manage, Document do |document|
      !user.nil?
    end

    can :manager, ProjectCall do |call|
      !user.nil?
    end
  end
end