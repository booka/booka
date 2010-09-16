class ProjectCallsController < ApplicationController
  before_filter :load_project
  
  def show
    @call = Document.find @project.properties[:call]
    @projects = Project.all if params[:browser] != 'projects'
  end
end
