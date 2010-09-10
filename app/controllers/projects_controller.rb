class ProjectsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js

  def update
    update! do
      @projects = Project.all
      Pusher['booka'].trigger('activity', {:body => "#{current_user.name} ha actualizado el projecto <a href='#'>#{@project.title}</a>"})
    end
  end
end
