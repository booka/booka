class WorkspaceController < ApplicationController

  caches_page :entrance, :about

  def entrance
    @remote = true
  end

  def about
    render :action => 'about', :layout => 'public'
  end

  def chat
    render :action => 'chat', :layout => 'public'
  end

  def test_exception_notifier
    raise 'Test exception notifier (booka).'
  end
end
