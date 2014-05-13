class OrganisationSurvey < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :survey
	has_many :survey_results
end
