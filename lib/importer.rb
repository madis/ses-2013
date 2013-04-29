require 'active_support/core_ext/hash/slice'
class Importer
  def import (filename)
    p 'Import ftw!'
    CSV.foreach(Rails.root.join('data', filename), :quote_char => '"', :headers => true,  :header_converters => :symbol, :col_sep => ';')  do |row|

      selected_values = row.to_hash.slice(:adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :oled, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y)

      AdsEntry.create!(selected_values)
    end
    p 'Import done!'
  end
end
