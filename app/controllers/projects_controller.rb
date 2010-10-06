class ProjectsController < ApplicationController
  inherit_resources
  respond_to :js
  actions :update, :index

  def browser
    @projects = Project.all
  end

  def update
    update! do
      @projects = Project.all
      activity = Activity.project("#{current_user.name} ha actualizado el projecto #{@project.title}", :update, current_user, @project)
      Pusher['booka'].trigger('activity', {:body => activity.description})
    end
  end
end
