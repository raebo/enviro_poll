class AddQuestionMeasurementToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_measurement, :text
  end
end
