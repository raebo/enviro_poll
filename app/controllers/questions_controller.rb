class QuestionsController < ApplicationController

  def new
    session[:curr_ques] = params[:format].to_i
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
  	@current_question = Question.find(params[:format])
    @results = Result.all
  end

  def edit
    session[:curr_ques] = params[:id].to_i
    session[:curr_op_ques] = (session[:curr_ques] - 9)
    session[:next_ques] = (session[:curr_ques] + 1)
    session[:prev_ques] = (session[:curr_ques] - 1)
    @current_survey_id = OrganisationSurvey.find_by_sql(["SELECT id FROM organisation_surveys WHERE organisation_id = ?", session[:current_organisation_id]]).last
    @survey_result = SurveyResult.find_by_sql(["SELECT * FROM survey_results WHERE question_id = ? AND organisation_survey_id = ?", session[:curr_ques], @current_survey_id]).first
    if session[:curr_ques] <= 9
      @sum_questions = 9 
    else
      @sum_questions = 32
    end
    @current_question = Question.find(params[:id])
    @results = Result.all
  end

  def create
  	set_organisation_survey if session[:first_time] == "y" # das vielleicht noch anders überprüfen und session[:first_time] weglassen
    @survey_result = SurveyResult.new result_params
    @survey_result.organisation_survey_id = session[:current_organisation_survey_id]
    @survey_result.question_id = session[:curr_ques]
   
    if (!(params[:survey_result][:result_id].blank?) && @survey_result.save)
      session[:first_time] = "n"
      if session[:curr_ques] == 9
        redirect_to static_pages_morequestions_path
      elsif session[:curr_ques] >= 41
        redirect_to evaluation_index_path
        session[:first_time] = "y"
      else
        redirect_to new_question_path(session[:next_ques])
      end
    else
      flash[:notice] = t('.choose')
      redirect_to new_question_path(session[:curr_ques])
    end
  end

  def update
    @current_survey_id = OrganisationSurvey.find_by_sql(["SELECT id FROM organisation_surveys WHERE organisation_id = ?", session[:current_organisation_id]]).last
    @survey_result = SurveyResult.find_by_sql(["SELECT * FROM survey_results WHERE question_id = ? AND organisation_survey_id = ?", session[:curr_ques], @current_survey_id]).first
   
    if @survey_result.update_attributes(result_params)
      if session[:curr_ques] == 9
        redirect_to static_pages_morequestions_path
      elsif session[:curr_ques] >= 41
        redirect_to evaluation_index_path
        session[:first_time] = "y" # nötig?
      else
        @next_ques_result = SurveyResult.find_by_sql(["SELECT * FROM survey_results WHERE question_id = ? AND organisation_survey_id = ?", session[:next_ques], @current_survey_id]).first
        if @next_ques_result.blank?
          redirect_to new_question_path(session[:next_ques])
        else
          redirect_to edit_question_path(session[:next_ques])
        end
      end
    else
      flash[:notice] = t('.choose')
      redirect_to edit_question_path(session[:curr_ques])
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

end
