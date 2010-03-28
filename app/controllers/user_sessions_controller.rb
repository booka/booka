class UserSessionsController < ApplicationController
  inherit_resources
  actions :new, :create, :destroy

  def create
    create! do |success|
      success.html { redirect_to params[:url].blank? ? root_path : params[:url] }
    end
  end
end
