
class Ability
  include CanCan::Ability

  def initialize(user)
    can(:manage, Project) do |project|
      !user.nil?
    end

    can(:manage, Site) do |site|
      !user.nil?
    end

    can(:read, Project) do |project|
      !user.nil? || project.visibility == 'public'
    end

    can(:manage, Document) do |document|
      !user.nil?
    end

    can(:manage, Clip) do |clip|
      !user.nil?
    end
  end
end