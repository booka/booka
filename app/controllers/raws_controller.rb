class RawsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    render :action => 'show', :layout => false
  end
end
