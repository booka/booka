class DocumentsController < ApplicationController
  inherit_resources
  before_filter :load_project
  belongs_to :project

  def index
    @documents = @project.documents
  end

  def show
    @documents = @project.documents
    @document = Document.find(params[:id])
    show!
  end
end
