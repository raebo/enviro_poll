class NaceCode < ActiveRecord::Base
	has_ancestry
	has_many :organisations
end
