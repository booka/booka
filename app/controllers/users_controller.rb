class UsersController < ApplicationController
  inherit_resources
  respond_to :js
  actions :index, :show

  def show
    if params[:browser] != 'users'
      @users = User.all
    end
    show!
  end
end
