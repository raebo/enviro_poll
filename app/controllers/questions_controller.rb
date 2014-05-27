class QuestionsController < ApplicationController

  def new
    session[:curr_ques] = params[:number].to_i
    session[:curr_op_ques] = (session[:curr_ques] - 9)
    session[:next_ques] = (session[:curr_ques] + 1)
    session[:prev_ques] = (session[:curr_ques] - 1)
  	unless session[:first_time]
	    session[:first_time] = "y"
	  end
  	@survey_result = SurveyResult.new
  	if session[:curr_ques] <= 9
      @sum_questions = 9 
    else
      @sum_questions = 32
    end
  	@current_question = Question.find(params[:number])
    @results = Result.all
  end

  def create
  	set_organisation_survey if session[:first_time] == "y"
    @survey_result = SurveyResult.new result_params
    @survey_result.organisation_survey_id = session[:current_organisation_survey_id]
    @survey_result.question_id = session[:curr_ques]
   
    if @survey_result.save
      session[:first_time] = "n"
      if session[:curr_ques] == 9
        redirect_to static_pages_morequestions_path
      elsif session[:curr_ques] >= 41
        redirect_to evaluation_index_path
        session[:first_time] = "y"
      else
        redirect_to new_question_url(number: session[:next_ques])
      end
    else
      render action: :new
    end
  end

  def set_organisation_survey
  	@organisation_survey = OrganisationSurvey.new
    @organisation = Organisation.find(session[:current_organisation_id]) 
    @organisation_survey.organisation_id = @organisation.id
    @organisation_survey.survey_id = Question.find(1).survey_id
    @organisation_survey.organisation_survey_date = DateTime.now
    @organisation_survey.save! # Fehlerabfang nötig?
    session[:current_organisation_survey_id] = @organisation_survey.id
  end

  private
  def result_params
    params.require(:survey_result).permit!
  end

  # am Ende der Fragen eine Variable (z.B. survey_done) auf true setzen, damit kann man dann unterscheiden ob man in den new oder edit Path gehen muss wenn der Nutzer die Umfrage startet
  # session first time muss noch unterteilt werden für obligatorische und freiwillige Fragen, weil ein Nutzer auch nur die obligatorischen machen könnte und später dann die optionalen und da dürfte dann nicht edit view kommen sondern new

end
