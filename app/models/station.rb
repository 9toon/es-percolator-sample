class Station < ActiveRecord::Base
  include Concerns::Searchable

  mapping do
    indexes :id, type: 'string', index: 'not_analyzed'
    indexes :name, type: 'string', analyzer: 'kuromoji'
    indexes :location, type: 'geo_point'
  end

  def as_indexed_json(options = {})
    { 'id'       => id,
      'name'     => name,
      'location' => "#{lat},#{lon}",
    }
  end
end
