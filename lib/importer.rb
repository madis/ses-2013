require 'csv'

class Importer
  def import(data)

    parsed_csv = CSV.parse data, headers: true, col_sep: ';'
    # binding.pry
    {
      headers: parsed_csv.headers.map {|header| header.downcase.to_sym },
      rows: []
    }
  end
  # def import(filename)
  #   require 'active_support/core_ext/hash/slice'
  #   p 'Import ftw!'
  #   CSV.foreach(Rails.root.join('data', filename), :quote_char => '"', :headers => true,  :header_converters => :symbol, :col_sep => ';')  do |row|
  #     selected_values = row.to_hash.slice(:adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :oled, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y)
  #     AdsEntry.create!(selected_values)
  #   end
  #   p 'Import done!'
  # end
end

CSV.parse "nimi;\n\"Madis Nõmme\"", headers: true, return_headers: true, col_sep: ';'
