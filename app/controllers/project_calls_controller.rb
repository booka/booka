class ProjectCallsController < ApplicationController
  before_filter :load_project
  
  def show
    @projects = Project.all
    @call = @project.calls.first
  end
end
