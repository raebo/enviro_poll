class Organisation < ActiveRecord::Base
	belongs_to :nace_code
    has_many :organisation_surveys

    before_create :set_login_token

    scope :authenticatable, where("organisations.login_token IS NOT NULL")

	FORMS_OF_ADDRESS = ["Herr", "Frau"]

	COUNTRIES = ["Belgien", "Dänemark", "Deutschland", "Frankreich", "Luxemburg", "Niederlande", "Österreich", "Polen",
				"Schweiz", "Tschechien"]

	HUMANIZED_ATTRIBUTES = {
    :organisation_name => "Das Feld 'Name der Organisation'",
    :organisation_street => "Das Feld 'Straße'",
    :organisation_street_number => "Das Feld 'Hausnummer'",
    :organisation_zipcode => "Das Feld 'Postleitzahl'",
    :organisation_city => "Das Feld 'Stadt'",
    :organisation_country => "Das Feld 'Land'",
    :user_form_of_address => "Das Feld 'Anrede'",
    :user_first_name => "Das Feld 'Vorname'",
    :user_last_name => "Das Feld 'Nachname'",
    :user_phone => "Das Feld 'Telefon'",
    :user_email => "Die E-Mail-Adresse"
    }

    def self.human_attribute_name(attr, options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end

	validates :organisation_name, :organisation_street, :organisation_street_number, :organisation_zipcode,
	:organisation_city, :user_first_name, :user_last_name, :user_phone, :user_email,
	presence: {message: "%{value} darf nicht leer sein."} 
	validates :organisation_country, inclusion: {in: COUNTRIES, message: "wurde nicht ausgewählt."}
	validates :user_form_of_address, inclusion: {in: FORMS_OF_ADDRESS, message: "wurde nicht ausgewählt."}
	validates :user_email, uniqueness: {message: "wird bereits genutzt."}
    validates :user_email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/, message: "ist ungültig.", if: Proc.new { |a| a.user_email.present? }}

    private
    def set_login_token
      self.login_token = loop do
        random_token = SecureRandom.urlsafe_base64(16)
        break random_token unless Organisation.exists?(login_token: random_token)
      end
    end

end
