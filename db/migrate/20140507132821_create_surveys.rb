class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :survey_title
      t.text :survey_description

      t.timestamps
    end
  end
end
