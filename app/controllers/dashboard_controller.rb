class DashboardController < ApplicationController

  def index
    #@time = Time.now
	# wird im views/dashboard index.html.erb mit <%= @time -%> aufgerufen
  end

  def authenticate
  	organisation = Organisation.authenticatable.find_by_login_token!(params[:id])
    session[:current_organisation_id] = organisation.id
    @organisation_name = current_organisation.organisation_name
  end

end
