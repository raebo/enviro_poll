require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant::import_nace_code
  task import_nace_code: :environment do

    file_path = "#{Rails.root}/db/nace_code_import.csv"

    csv_file = File.read(csv_file_path)

    CSV.parse(csv_file, headers: false, col_sep: ";").each do |row|

    end
  end
end
