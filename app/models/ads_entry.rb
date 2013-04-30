class AdsEntry < ActiveRecord::Base
  attr_accessible :adob_id, :adr_id, :ads_kehtiv, :ads_oid, :lahiaadress, :olek, :orig_tunnus, :taisaadress, :viitepunkt_x, :viitepunkt_y

  include Tire::Model::Search

  # Tire (Elasticsearch) mapping & indexing
  # mapping do
  #   indexes :taisaadress

  # end

  def self.simple_search(search)
    unless search.nil?
      condition_values = search.split(' ')
      conditions = ['taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ? AND taisaadress ilike ?',
        "%#{condition_values[0]}%", "%#{condition_values[1]}%", "%#{condition_values[2]}%", "%#{condition_values[3]}%", "%#{condition_values[4]}%"]
      find(:all,
        limit: 100,
        conditions: conditions)

    end
  end

  def self.tire_search(query)
    tire.search(load: true) do
      query { string query if query.present? }
    end
  end
end
