class UserSessionsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js
  actions :new, :create, :destroy

  def create
    create! do |success, failure|
      success.html { redirect_to params[:url].blank? ? root_path : params[:url] }
      failure.html { render :action => 'new'}
      failure.js { render :action => 'failure.js'}
    end
  end
end
