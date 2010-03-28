class UserSessionsController < ApplicationController
  inherit_resources
  actions :new, :create, :destroy

  def create
    create! do |success|
      success.html { redirect_to root_path}
    end
  end
end
