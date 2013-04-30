class AdsEntry < ActiveRecord::Base
  attr_accessible :adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :olek, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y

  include Tire::Model::Search

  # Tire (Elasticsearch) mapping & indexing
  # mapping do
  #   indexes :taisaadress

  # end

  def self.simple_search(search)
    unless search.nil?
      conditions = search.split(' ')
      find(:all, :conditions => ['taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ?',
                                 "%#{conditions[0]}%", "%#{conditions[1]}%", "%#{conditions[2]}%", "%#{conditions[3]}%", "%#{conditions[4]}%"])
    end
  end

  def self.tire_search(query)
    tire.search(load: true) do
      query { string query if query.present? }
    end
  end
end
