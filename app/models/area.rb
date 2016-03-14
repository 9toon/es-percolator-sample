class Area < ActiveRecord::Base
  include Concerns::Searchable

  mapping do
    indexes :id, type: 'string', index: 'not_analyzed'
    indexes :name, type: 'string', analyzer: 'kuromoji'
    indexes :location, type: 'geo_shape'
  end

  def as_indexed_json(options = {})
    { 'id'       => id,
      'name'     => name,
      'location' => {
        'type' => 'polygon',
        'coordinates' => [coordinates],
      }
    }
  end

  serialize :coordinates
end
