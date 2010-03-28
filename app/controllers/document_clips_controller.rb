class DocumentClipsController < ApplicationController
  inherit_resources
  defaults :resource_class => Clip, :collection_name => 'clips', :instance_name => 'clip'
  before_filter :load_document
  belongs_to :document


  def new
    @clip = @document.new_clip(params[:clip], current_user)
    new!
  end

  def create
    @clip = @document.new_clip(params[:clip], current_user)
    create! do |success, failure|
      success.html {redirect_to project_document_path(@document.project, @document)}
    end
  end

  def update
    update! do |success, failure|
      success.html {redirect_to project_document_path(@document.project, @document)}
    end
  end

  private
  def load_document
    @document = Document.find(params[:document_id])
  end
end
