ActionController::Routing::Routes.draw do |map|

  map.resources(:user_sessions, :as => 'sesion')
  map.resources(:projects, :as => 'investigaciones') do |project|
    project.resource(:project_call, :as => 'convocatoria')
    project.resources(:documents, :as => 'archivos')
  end
  
  map.root :controller => 'projects', :action => 'index'

  map.entrance '/entrada', :controller => 'workspace', :action => 'entrance'
end
