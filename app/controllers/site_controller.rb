class SiteController < ApplicationController
  caches_page :workspace

  def workspace
    @remote = true
    render :layout => 'workspace'
  end

  def edit
    @site = Site.get
  end

  def update
    @site = Site.get
    if @site.update_attributes(params[:site])
      flash[:notice] = "Se ha guardado la información."
      render :action => 'show'
    else
      flash[:error] = "Ha habiedo un error."
      render :action => 'edit'
    end
  end

  def show
    @site = Site.get
    if (params[:browser] != 'projects')
      @projects = @site.projects
    end
  end

  def about
    render :action => 'about', :layout => 'public'
  end

  def chat
    render :action => 'chat', :layout => 'public'
  end

  def ccc
    redirect_to '/investigaciones/174-camiones-contenedores-colectivos/convocatoria'
  end

  def test_exception_notifier
    raise 'Test exception notifier (booka).'
  end
end
