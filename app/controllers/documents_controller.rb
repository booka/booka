class DocumentsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js
  actions :show, :edit, :update
  
  def show
    @document = Document.find(params[:id])
    @project = @document.project
    show!
  end

  def edit
    edit! do |action|
      action.js {render :js => client.show_dialog(render_to_string( :partial => 'form' ))}
    end
  end

  def update
    update! do |success, failure|
      success.js { render :action => 'update.js'}
    end
  end
end
