class DocumentsController < ApplicationController

  def show
    document = Document.find(params[:id])
    redirect_to project_document_path(document.project, document)
  end
end
