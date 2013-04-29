# encoding: utf-8
require 'csv'
require 'active_support/core_ext/hash/slice'

class Importer
  def import(filename)
    import_using_sql(filename)
  end

  def import_using_create(filename)
    CSV.foreach(Rails.root.join('data', filename), :quote_char => '"', :headers => true,  :header_converters => :symbol, :col_sep => ';', encoding: 'iso-8859-1')  do |row|
      selected_values = row.to_hash.slice(:adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :oled, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y)
      AdsEntry.create!(values)
    end
  end

  def import_using_sql(filename)
    total_counter = 0
    row_counter = 0
    row_data = []

    CSV.foreach(Rails.root.join('data', filename), :quote_char => '"', :headers => true,  :header_converters => :symbol, :col_sep => ';', encoding: 'iso-8859-1')  do |row|
      selected_values = row.to_hash.slice(:adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :oled, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y)
      row_data << AdsEntry.new(selected_values)
      row_counter += 1
      total_counter += 1
      if row_counter > 499
        measure = Benchmark.measure { AdsEntry.import row_data }
        p "#{total_counter} items #{measure}"
        row_counter = 0
        row_data = []
      end
    end
  end
end

