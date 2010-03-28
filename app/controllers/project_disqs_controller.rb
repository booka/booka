class ProjectDisqsController < ApplicationController
  inherit_resources
  defaults :resource_class => Disq, :collection_name => 'disqs', :instance_name => 'disq'
  before_filter :load_project
  belongs_to :project

  def index
    @disqs = @project.disqs.all
  end

  def show
    @disqs = @project.disqs.all
    @disq = Disq.find(params[:id])
    @tree = @disq.subtree.arrange
    show!
  end

  def new
    @disq = @project.new_disq(params[:disq], current_user)
    new!
  end

  def create
    @disq = @project.new_disq(params[:disq], current_user)
    create!
  end
end
