class CreateOrganisationSurveys < ActiveRecord::Migration
  def change
    create_table :organisation_surveys do |t|
      t.integer :organisation_id
      t.integer :survey_id
      t.datetime :organisation_survey_date

      t.timestamps
    end
  end
end
