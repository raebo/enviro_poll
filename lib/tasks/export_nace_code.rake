require 'csv'
namespace :siimbyant do
  # aufruf mit bundle exec rake siimbyant:export_nace_code
  task export_nace_code: :environment do

    file_path = "#{Rails.root}/db/"
    file_name = "nace_code_export.csv"

    @nace_codes = NaceCode.all

    CSV.open(file_path + file_name, "w", col_sep: "+") do |writer|
      @nace_codes.each do |nc|
      writer << [nc.code, nc.description, nc.ancestry]
      end
    end

  end
end

