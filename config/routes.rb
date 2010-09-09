ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resource(:site, :as => 'ui')
  
  map.resource(:user_sessions, :as => 'sesion', :member => {:close => :get})

  map.resource(:project_browser, :as => 'investigaciones', :controller => :project_browser)

  map.resources(:projects, :as => 'booka') do |project|
    project.resource(:project_call, :as => 'convocatoria')
    project.resource(:index, :controller => 'project_indexes', :as => 'explorar')
    project.resources(:documents, :controller => 'project_documents', :as => 'archivos')
    project.resources(:disqs, :controller => 'project_disqs', :as => 'discusiones')
    #project.resources(:pages, :controller => 'project_pages',  :as => 'explorar')
  end

  map.resource(:user, :as => 'mi') do |user|
    user.resource(:calendar, :controller => 'user_calendars', :as => 'calendario')
    user.resource(:activity, :controller => 'user_activities', :as => 'actividad')
    user.resource(:profile, :controller => 'user_profiles', :as => 'perfil')
  end

  map.resources(:disqs, :as => 'discusion') do |disq|
  end

  map.resources(:documents, :as => 'archivos') do |document|
    document.resources(:clips, :controller => 'document_clips', :as => 'clips')
  end

  map.chat '/chat', :controller => 'site', :action => 'chat'
  map.root :controller => 'site', :action => 'about'
  map.connect 'test_exception', :controller => 'site', :action => 'test_exception_notifier'
  map.pusher_trigger '/pusher/trigger', :controller => 'pusher', :action => 'trigger'
  map.connect '/pusher/:action', :controller => 'pusher'

end
