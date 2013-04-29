class AdsEntry < ActiveRecord::Base
  attr_accessible :adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :olek, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y

  def self.simple_search(search)
    unless search.nil?
      find(:all, :conditions => ['taisaadress LIKE ?', "%#{search}%"])
    end
  end
end
