require 'csv'

namespace :adb do
  desc 'Import data from CSV to database'
  #For example rake adb:import_data[136_rows.csv]
  task :import_data, [:filename] => :environment do |t, args|
    puts 'Importing...'
    Importer.new.import (args.filename)
  end
end
