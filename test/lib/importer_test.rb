require_relative '../fast_test_helper'
require_relative '../../lib/importer'

CSV_HEADER = "ADOB_ID;ADS_OID;ADOB_LIIK;ORIG_TUNNUS;ETAK_ID;ADS_KEHTIV;OLEK;ADR_ID;KOODAADRESS;TAISAADRESS;LAHIAADRESS;AADR_OLEK;VIITEPUNKT_X;VIITEPUNKT_Y;TASE1_KOOD;TASE1_NIMETUS;TASE1_NIMETUS_LIIGIGA;TASE2_KOOD;TASE2_NIMETUS;TASE2_NIMETUS_LIIGIGA;TASE3_KOOD;TASE3_NIMETUS;TASE3_NIMETUS_LIIGIGA;TASE4_KOOD;TASE4_NIMETUS;TASE4_NIMETUS_LIIGIGA;TASE5_KOOD;TASE5_NIMETUS;TASE5_NIMETUS_LIIGIGA;TASE6_KOOD;TASE6_NIMETUS;TASE6_NIMETUS_LIIGIGA;TASE7_KOOD;TASE7_NIMETUS;TASE7_NIMETUS_LIIGIGA;TASE8_KOOD;TASE8_NIMETUS;TASE8_NIMETUS_LIIGIGA"
CSV_SAMPLE = <<END
ADOB_ID;ADS_OID;ADOB_LIIK;ORIG_TUNNUS;ETAK_ID;ADS_KEHTIV;OLEK;ADR_ID;KOODAADRESS;TAISAADRESS;LAHIAADRESS;AADR_OLEK;VIITEPUNKT_X;VIITEPUNKT_Y;TASE1_KOOD;TASE1_NIMETUS;TASE1_NIMETUS_LIIGIGA;TASE2_KOOD;TASE2_NIMETUS;TASE2_NIMETUS_LIIGIGA;TASE3_KOOD;TASE3_NIMETUS;TASE3_NIMETUS_LIIGIGA;TASE4_KOOD;TASE4_NIMETUS;TASE4_NIMETUS_LIIGIGA;TASE5_KOOD;TASE5_NIMETUS;TASE5_NIMETUS_LIIGIGA;TASE6_KOOD;TASE6_NIMETUS;TASE6_NIMETUS_LIIGIGA;TASE7_KOOD;TASE7_NIMETUS;TASE7_NIMETUS_LIIGIGA;TASE8_KOOD;TASE8_NIMETUS;TASE8_NIMETUS_LIIGIGA
118006;"LP00012285";"LP";"2119541";;"19.02.2004 06:40:40";"K";108838;"377840524000004DS0000000000000000";"Harju maakond, Tallinna linn, Nõmme linnaosa, Kalevala tn";"Kalevala tn";"K";536589,24;6582445,70;"37";"Harju maakond";"Harju maakond";"784";"Tallinna linn";"Tallinna linn";"0524";"Nõmme linnaosa";"Nõmme linnaosa";"";"";"";"04DS";"Kalevala tn";"Kalevala tänav";"";"";"";"";"";"";"";"";""
END

# Get symbolized & lowercased headers using
# "SOME;HEADER".strip.split(";").map { |title| title.downcase.to_sym}
CSV_SYM_HEADER = [:adob_id, :ads_oid, :adob_liik, :orig_tunnus, :etak_id,
  :ads_kehtiv, :olek, :adr_id, :koodaadress, :taisaadress, :lahiaadress,
  :aadr_olek, :viitepunkt_x, :viitepunkt_y, :tase1_kood, :tase1_nimetus,
  :tase1_nimetus_liigiga, :tase2_kood, :tase2_nimetus, :tase2_nimetus_liigiga,
  :tase3_kood, :tase3_nimetus, :tase3_nimetus_liigiga, :tase4_kood,
  :tase4_nimetus, :tase4_nimetus_liigiga, :tase5_kood, :tase5_nimetus,
  :tase5_nimetus_liigiga, :tase6_kood, :tase6_nimetus, :tase6_nimetus_liigiga,
  :tase7_kood, :tase7_nimetus, :tase7_nimetus_liigiga, :tase8_kood,
  :tase8_nimetus, :tase8_nimetus_liigiga]

describe Importer do
  it 'associates keys with values' do
    importer = Importer.new :nimi, :vanus
    imported = importer.import 'nimi;vanus\n"Volli";55'
    imported.must
  end
end

# Parse manually
