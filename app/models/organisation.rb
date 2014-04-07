class Organisation < ActiveRecord::Base
	belongs_to :nace_code

	validates :organisation_name, :organisation_street, :organisation_street_number, :organisation_zipcode, :organisation_city, :organisation_country, :user_form_of_address, :user_title, :user_first_name, :user_last_name, :user_birthday, :user_phone, :user_email, presence: true
	# noch mehr validations einfügen, z.B. korrektes datum, korrektes emailformat usw.
end
