ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resource(:site, :as => 'booka', :controller => :site)
  
  map.resource(:user_sessions, :as => 'sesion', :member => {:close => :get})

  map.resources(:projects, :as => 'investigaciones', :collection  => {:browser => :get}) do |project|
    project.resource(:project_call, :as => 'convocatoria')
    project.resource(:index, :controller => 'project_indexes', :as => 'indice', :member => {:browser => :get})
    project.resources(:documents, :controller => 'project_documents', :as => 'articulos')
    project.resources(:disqs, :controller => 'project_disqs', :as => 'discusiones')
    #project.resources(:pages, :controller => 'project_pages',  :as => 'explorar')
  end

  map.resource(:current_user, :as => 'mi', :controller => 'current_user') do |user|
    user.resource(:calendar, :controller => 'user_calendars', :as => 'calendario')
    user.resource(:activity, :controller => 'user_activities', :as => 'actividad')
    user.resource(:profile, :controller => 'user_profiles', :as => 'perfil')
  end

  map.resources(:users, :as => 'colaboradorxs')
  map.resources(:activity_reports, :as => 'actividades')
  map.resources(:disqs, :as => 'discusion') do |disq|
  end

  map.resources(:documents, :as => 'archivos') do |document|
    document.resources(:clips, :controller => 'document_clips', :as => 'clips')
  end

  map.resources(:chapters, :as => 'ver')
  map.resources(:raws, :as => 'raw')

  map.root :controller => 'site', :action => 'workspace'
  map.ccc '/ccc', :controller => 'site', :action => 'ccc'
  map.chat '/chat', :controller => 'site', :action => 'chat'
  map.ui '/ui', :controller => 'site', :action => 'workspace'
  map.connect 'test_exception', :controller => 'site', :action => 'test_exception_notifier'
  map.pusher_trigger '/pusher/trigger', :controller => 'pusher', :action => 'trigger'
  map.connect '/pusher/:action', :controller => 'pusher'

end
