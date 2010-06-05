class ProjectsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js

  def update
    update! do
      @projects = Project.all
    end
  end
end
