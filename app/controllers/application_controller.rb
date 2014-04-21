class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_organisation
    @current_organisation ||= session[:current_organisation_id] && Organisation.find_by(id: session[:current_organisation_id])
    @current_organisation ||= false
  end
  
  helper_method :current_organisation
end
