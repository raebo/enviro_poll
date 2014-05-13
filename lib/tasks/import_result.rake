require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant:import_result
  task import_result: :environment do

    file_path = "#{Rails.root}/db/result_import.csv"

    csv_file = File.read(file_path)

    CSV.parse(csv_file, headers: true, col_sep: "+").each do |row|
      Result.create!(row.to_hash)
    end
  end
end