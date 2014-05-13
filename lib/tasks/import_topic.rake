require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant:import_topic
  task import_topic: :environment do

    file_path = "#{Rails.root}/db/topic_import.csv"

    csv_file = File.read(file_path)

    CSV.parse(csv_file, headers: true, col_sep: "+").each do |row|
      Topic.create!(row.to_hash)
    end
  end
end
