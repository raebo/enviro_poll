class AddCalculationToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :calculation, :text
  end
end
