class ProjectDocumentsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js
  defaults :resource_class => Document, :collection_name => 'documents', :instance_name => 'document'
  before_filter :load_project
  belongs_to :project
  include JsBookaHelper

  def index
    @documents = @project.documents.all
  end

  def show
    @documents = @project.documents.all
    @document = Document.find(params[:id])
    show!
  end

  def new
    @document = @project.new_document(current_user, params[:document])
    new! do |action|
      action.js { render :js => client.show_dialog(render_to_string(:partial => 'form'))}
    end
  end

  def create
    @document = @project.new_document(current_user, params[:document])
    create! do |success, failure|
      success.html { redirect_to @document}
      failure.html { render :action => 'new'}
      success.js do
        @documents = @project.documents
        render :action => 'create.js'
      end
      failure.js { render :action => 'failure.js'}
    end
  end
end
