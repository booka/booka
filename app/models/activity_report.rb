# To change this template, choose Tools | Templates
# and open the template in the editor.

class ActivityReport
  attr_reader :type, :title, :user, :project, :activities

  def self.all
    ActivityReport.new(:all, nil, nil)
  end


  def self.find_by_user(user)
    ActivityReport.new(:user, user, nil)
  end

  def self.find_by_project(project)
    ActivityReport.new(:project, nil, project)
  end

  def initialize(type, user, project)
    @type = type
    @user = user
    @project = project
    case @type
    when :all
      @title = "Actividad de plataformabooka.net"
      @activities = Activity.all
    when :user
      @title = "Activdad de #{@user.name}"
      @activities = Activity.all
    when :project
      @title = "Actividad en '#{@project.title}'"
      @activities = Activity.all
    end
  end
end
