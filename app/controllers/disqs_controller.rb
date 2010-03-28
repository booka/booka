class DisqsController < ApplicationController
  inherit_resources
  actions :edit, :update, :create
  before_filter :load_top_id
    
  def edit
    @disq = Disq.find(params[:id])
  end

  def new
    @parent = Disq.find(params[:parent_id])
    @disq = @parent.new_response(params[:disq], current_user)
  end

  def create
    @parent = Disq.find(params[:parent_id])
    @disq = @parent.new_response(params[:disq], current_user)
    create! do |success, failure|
      success.html { redirect_to project_disq_path(@disq.project.id, @top.id)}
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to project_disq_path(@disq.project.id, @top.id)}
    end
  end

  private
  def load_top_id
    @top = Disq.find params[:top_id]
  end
end
