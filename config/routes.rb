ActionController::Routing::Routes.draw do |map|

  map.resources(:user_sessions, :as => 'sesion')

  map.resources(:projects, :as => 'investigaciones') do |project|
    project.resource(:project_call, :as => 'convocatoria')
    project.resource(:index, :controller => 'project_indexes', :as => 'explorar')
    project.resources(:documents, :controller => 'project_documents', :as => 'archivos')
    project.resources(:disqs, :controller => 'project_disqs', :as => 'discusiones')
    #project.resources(:pages, :controller => 'project_pages',  :as => 'explorar')
  end

  map.resources(:disqs, :as => 'discusion') do |disq|
  end

  map.resources(:documents, :as => 'archivos') do |document|
    document.resources(:clips, :controller => 'document_clips', :as => 'clips')
  end
  
  map.root :controller => 'projects', :action => 'index'

  map.ui '/ui', :controller => 'workspace', :action => 'entrance'
end
