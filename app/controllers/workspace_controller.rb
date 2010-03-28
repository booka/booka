class WorkspaceController < ApplicationController

  def entrance
    @projects = Project.all
  end
end
