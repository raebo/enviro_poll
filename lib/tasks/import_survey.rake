require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant:import_survey
  task import_survey: :environment do

    file_path = "#{Rails.root}/db/survey_import.csv"

    csv_file = File.read(file_path)

    CSV.parse(csv_file, headers: true, col_sep: "+").each do |row|
      Survey.create!(row.to_hash)
    end
  end
end