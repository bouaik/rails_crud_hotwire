require 'csv'


namespace :import do
  desc "Import data from a CSV file"
  task :csv_data => :environment do


    # csv_file_path =  './lib/tasks/data.csv'

    # CSV.foreach(csv_file_path) do |row|
    #   Application.find_or_create_by count: row[0].to_i, year: row[1].to_i
    # end
    (1000..2000).to_a.each do |year|
      Application.find_or_create_by count: rand(0..10000), year: year
    end
  end
end
