class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :street
      t.integer :street_number
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :user_form_of_address
      t.string :user_title
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_birthday
      # statt string noch ein datum nutzen?
      t.string :user_phone
      t.strimg :user_fax
      t.string :user_email
      t.integer :nace_code_id
      t.timestamps
    end
  end
end
