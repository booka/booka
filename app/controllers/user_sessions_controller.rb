class UserSessionsController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json, :js
  actions :new, :create, :destroy

  def create
    create! do |success, failure|
      success.html do
        redirect_to params[:url].blank? ? root_path : params[:url] 
      end
      failure.html { render :action => 'new'}
      failure.js { render :action => 'failure.js'}
    end
  end

  def destroy
    destroy! do |success|
      success.html { redirect_to params[:url].blank? ? root_path : params[:url] }
    end
  end

  def close
    @user_session = current_user_session
  end
end
