class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.integer :organisation_survey_id
      t.integer :question_id
      t.string :result
      t.float :value

      t.timestamps
    end
  end
end
