class ChaptersController < ApplicationController
  def show
    @document = Document.find(params[:id])
    @project = @document.project
  end
end
