class ProjectDocumentsController < ApplicationController
  inherit_resources
  defaults :resource_class => Project, :collection_name => 'documents', :instance_name => 'document'
  before_filter :load_project
  belongs_to :project

  def index
    @documents = @project.documents.all
  end

  def show
    @documents = @project.documents.all
    @document = Document.find(params[:id])
    show!
  end

  def new
    @document = @project.documents.build
    new!
  end

  def create
    @document = @project.documents.build(params[:document])
    @document.user_id = current_user.id
    create!
  end
end
