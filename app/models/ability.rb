
class Ability
  include CanCan::Ability

  def initialize(user)
    can(:manage, Project) do |action, project|
      !user.nil?
    end

    can(:manage, Document) do |action, document|
      !user.nil?
    end

    can(:manage, Clip) do |action, clip|
      !user.nil?
    end
  end
end