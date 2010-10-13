class DocumentsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js
  actions :show, :edit, :update
  
  def show
    @document = Document.find(params[:id])
    @project = @document.project
    @documents = @project.documents if (params[:browser] != 'documents')
    show!
  end

  def edit
    @document = Document.find(params[:id])
    @project = @document.project
    @documents = @project.documents if (params[:browser] != 'documents')
    edit!
  end

  def update
    update! do |success, failure|
      success.js { render :action => 'update.js'}
    end
  end
end
