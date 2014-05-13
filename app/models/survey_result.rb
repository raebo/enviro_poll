class SurveyResult < ActiveRecord::Base
	belongs_to :organisation_survey
	belongs_to :question
	belongs_to :result
end
