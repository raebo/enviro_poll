class AddResultIdToSurveyResults < ActiveRecord::Migration
  def change
    add_column :survey_results, :result_id, :integer
  end
end
