class QuestionsController < ApplicationController

  def new
  	unless session[:counter]
	  session[:counter] = 1
	end

  	@survey_result = SurveyResult.new
  	@sum_questions = Question.all.count # später noch ändern, sodass nur die 9 für obligatorische Fragen angezeigt wird und nicht alle Fragen (inkl. optionalen)
  	@current_question = Question.find(session[:counter])
  end

  def create
  	set_organisation_survey if session[:counter] == 1
    
    @survey_result = SurveyResult.new result_params
    @survey_result.organisation_survey_id = session[:current_organisation_survey_id]
    @survey_result.question_id = session[:counter]
   
    if @survey_result.save
      session[:counter] += 1
      if session[:counter] <= 9 # die 9 müsste hier noch durch die Anzahl der obligatorischen Fragen ersetzt werden (Question.all.count geht nicht da es später noch weitere (freiwillige) Fragen gibt)
      redirect_to questions_new_path
      else
      redirect_to nace_codes_edit_path # muss später zur Seite mit der Frage "Wollen Sie weitere optionale Fragen beantworten?" weiterleiten
      end
    else
      render action: :new
    end
  end

  def set_organisation_survey
  	@organisation_survey = OrganisationSurvey.new
    @organisation = Organisation.find(session[:current_organisation_id]) 
    @organisation_survey.organisation_id = @organisation.id
    @organisation_survey.survey_id = Question.find(session[:counter]).survey_id
    @organisation_survey.organisation_survey_date = DateTime.now
    @organisation_survey.save! # Fehlerabfang nötig?
    session[:current_organisation_survey_id] = @organisation_survey.id
  end

  private
  def result_params
    params.require(:survey_result).permit!
  end

  # am Ende der Fragen eine Variable (z.B. survey_done) auf true setzen, damit kann man dann unterscheiden ob man in den new oder edit Path gehen muss wenn der Nutzer die Umfrage startet

end
