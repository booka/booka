class ChaptersController < ApplicationController
  def show
    @document = Document.find(params[:id])
    @project = @document.project
    if (params[:browser] != 'index')
       @index = @project.indexes.first
    end
  end
end
