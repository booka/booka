class ProjectCallsController < ApplicationController
  before_filter :load_project
  
  def show
    # FIXME: not always necessary
    @projects = Project.all
    @call = Document.find @project.properties[:call]
  end
end
