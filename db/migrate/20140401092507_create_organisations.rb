class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :organisation_name
      t.string :organisation_street
      t.string :organisation_street_number
      t.string :organisation_zipcode
      t.string :organisation_city
      t.string :organisation_country
      t.string :user_form_of_address
      t.string :user_title
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_birthday
      # statt string noch ein datum nutzen?
      t.string :user_phone
      t.string :user_fax
      t.string :user_email
      t.integer :nace_code_id
      t.timestamps
    end
  end
end
