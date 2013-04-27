class CreateAdsEntries < ActiveRecord::Migration
  def change
    create_table :ads_entries do |t|
      t.integer :adob_id
      t.string :ads_oid
      t.integer :orig_tunnus
      t.datetime :ads_kehtiv
      t.string :olek
      t.integer :adr_id
      t.string :taisaadress
      t.string :lahiaadress
      t.float :viitepunkt_x
      t.float :viitepunkt_y

      t.timestamps
    end
  end
end
