class Survey < ActiveRecord::Base
	has_many :organisation_surveys
	has_many :questions
end
