class Question < ActiveRecord::Base
	belongs_to :survey
	belongs_to :topic
	has_many :survey_results
end
