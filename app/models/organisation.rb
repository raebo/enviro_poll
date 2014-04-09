class Organisation < ActiveRecord::Base
	#belongs_to :nace_code

	FORMS_OF_ADDRESS = ["Herr", "Frau"]

	COUNTRIES = ["Belgien", "Dänemark", "Deutschland", "Frankreich", "Luxemburg", "Niederlande", "Österreich", "Polen",
				"Schweiz", "Tschechien"]

	validates :organisation_name, :organisation_street, :organisation_street_number, :organisation_zipcode, :organisation_city, :organisation_country, :user_form_of_address, :user_first_name, :user_last_name, :user_birthday, :user_phone, :user_email, presence: true
	# noch mehr validations einfügen, z.B. korrektes datum, korrektes emailformat usw.

	validates :organisation_country, inclusion: COUNTRIES

	validates :user_form_of_address, inclusion: FORMS_OF_ADDRESS

end
