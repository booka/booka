
class Ability
  include CanCan::Ability

  def initialize(user)
    can(:manage, Project) do |project|
      !user.nil?
    end

    can(:manage, Document) do |document|
      !user.nil?
    end

    can(:manage, ProjectCall) do |call|
      false
    end

    can(:manage, Clip) do |clip|
      !user.nil?
    end
  end
end