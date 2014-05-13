class RemoveResultFromSurveyResults < ActiveRecord::Migration
  def change
    remove_column :survey_results, :result, :string
  end
end
