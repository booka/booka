class SitesController < ApplicationController
  caches_page :show

  def show
    @site = Site.get
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
