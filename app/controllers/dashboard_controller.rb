class DashboardController < ApplicationController

  def index
  end

  def authenticate
  	organisation = Organisation.authenticatable.find_by_login_token!(params[:id])
    session[:current_organisation_id] = organisation.id
    # TODO: hier noch Fehlerabfang einbauen (wenn man Seite mit ungültigem Token aufruft entsprechende Meldung zeigen)

    @organisation_survey = OrganisationSurvey.find_by_sql(["SELECT * FROM organisation_surveys WHERE organisation_id = ?", session[:current_organisation_id]])
  end

end
