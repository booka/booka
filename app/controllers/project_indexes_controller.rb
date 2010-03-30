class ProjectIndexesController < ApplicationController
  before_filter :load_project
  inherit_resources
  respond_to :html, :xml, :json, :js
  belongs_to :project
  defaults :resource_class => Index, :collection_name => 'indexes', :instance_name => 'index'
  actions :show, :edit, :update

  def show
    @index = @project.indexes.first
    show!
  end

  def edit
    @index = @project.indexes.first
    edit!
  end

  def update
    @index = @project.indexes.first
    update! do |success, failure|
      success.html { redirect_to project_index_path(@project) }
    end
  end
end
