class ProjectBrowserController < ApplicationController
  def show
    @projects = Project.all
  end
end
