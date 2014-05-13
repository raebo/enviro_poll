class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.integer :topic_id
      t.string :question_title
      t.text :question_description
      t.string :unit

      t.timestamps
    end
  end
end
