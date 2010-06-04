# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ExceptionNotification::Notifiable
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'workspace'
  helper_method :has_project?, :current_project
  helper_method :current_user_session, :current_user

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def client
    JsHelper.instance
  end

  class JsHelper
    include Singleton
    include ActionView::Helpers::JavaScriptHelper
    include ClientHelper
    include ActionView::Partials
  end

  protected
  def load_project
    @project = Project.find(params[:project_id])
  end

  def current_project
    @project
  end

  def has_project?
    !@project.nil?
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  protected
  def render_optional_error_file(status_code)
    render :template => "errors/500", :status => status_code, :layout => 'public'
  end
end
