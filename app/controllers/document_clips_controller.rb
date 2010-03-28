class DocumentClipsController < ApplicationController
  inherit_resources
  defaults :resource_class => Clip, :collection_name => 'clips', :instance_name => 'clip'
  before_filter :load_document
  belongs_to :document



  def create
    @clip = @document.clips.build(params[:clip])
    @clip.user_id = current_user.id
    @clip.project_id = @document.project_id
    create! do |success|
      success.html {redirect_to project_project_document_path(@document.project, @document)}
    end
  end

  private
  def load_document
    @document = Document.find(params[:document_id])
  end
end
