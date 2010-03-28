ActionController::Routing::Routes.draw do |map|

  map.resources(:user_sessions, :as => 'sesion')
  map.resources(:projects, :as => 'investigaciones') do |project|
    project.resource(:project_call, :as => 'convocatoria')
    project.resources(:documents, :controller => 'project_documents', :as => 'archivos')
  end

  map.resources(:documents, :as => 'archivos') do |document|
    document.resources(:document_clips, :as => 'clips')
  end
  
  map.root :controller => 'projects', :action => 'index'

  map.entrance '/entrada', :controller => 'workspace', :action => 'entrance'
end
