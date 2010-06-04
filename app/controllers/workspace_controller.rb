class WorkspaceController < ApplicationController

  caches_page :entrance, :about

  def entrance
    @remote = true
  end

  def about
    render :action => 'about', :layout => false
  end
end
