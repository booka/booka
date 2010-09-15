class SiteController < ApplicationController
  caches_page :workspace

  def workspace
    @remote = true
  end

  def edit
    @site = Site.get
  end

  def update
    @site = Site.get
    if @site.update_attributes(params[:site])
      render :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def show
    @site = Site.get
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
