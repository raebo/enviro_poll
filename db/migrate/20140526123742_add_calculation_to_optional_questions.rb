class AddCalculationToOptionalQuestions < ActiveRecord::Migration
  def change
    add_column :optional_questions, :calculation, :text
  end
end
