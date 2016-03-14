class Spot < ActiveRecord::Base
  include Concerns::Searchable

  mapping do
    indexes :id, type: 'string', index: 'not_analyzed'
    indexes :name, type: 'string', analyzer: 'kuromoji'
    indexes :address, type: 'string', analyzer: 'kuromoji'
    indexes :location, type: 'geo_point'
  end

  def as_indexed_json(options = {})
    { 'id'       => id,
      'name'     => name,
      'address'  => address,
      'location' => "#{lat},#{lon}",
    }
  end

  def self.create_percolators
    Station.create_distance_percolates
    Area.create_polygon_percolates
  end
end
