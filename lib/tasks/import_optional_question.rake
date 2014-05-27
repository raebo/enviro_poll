require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant:import_optional_question
  task import_optional_question: :environment do

    file_path = "#{Rails.root}/db/optional_question_import.csv"

    csv_file = File.read(file_path)

    CSV.parse(csv_file, headers: true, col_sep: "#").each do |row|
      Question.create!(row.to_hash)
    end
  end
end