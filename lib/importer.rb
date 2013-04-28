require 'active_support/core_ext/hash/slice'
class Importer
  def import (filename)
    p 'Import ftw!'
    CSV.foreach(Rails.root.join('data', filename), :quote_char => '"', :headers => true, :col_sep => ';')  do |row|

      selected_values = row.to_hash.select{|k,v| ['ADOB_ID', 'ADR_ID', 'ADS_KEHTIV', 'ADS_OID', 'LAHIAADRESS', 'OLED', 'ORIG_TUNNUS', 'TAISAADRESS', 'VIITEPUNKT_X', 'VIITEPUNKT_Y'].include?(k)}

      lower_case_hash = {}
      selected_values.each_pair do |k,v|
        lower_case_hash.merge!({k.downcase => v})
      end

      AdsEntry.create!(lower_case_hash)
    end
    p 'Import done!'
  end
end
