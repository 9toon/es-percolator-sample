class Spot < ActiveRecord::Base
  include Elasticsearch::Model

  index_name "#{Rails.env}-#{Rails.application.class.to_s.downcase}-#{self.name.downcase}"

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

  def percolate
    Spot.__elasticsearch__.client.percolate(
      index: Spot.__elasticsearch__.index_name,
      type: Spot.__elasticsearch__.document_type,
      body: {
        doc: {
          location: {
            lat: lat,
            lon: lon,
          }
        }
      }
    )
  end

  def self.create_percolators
    Station.create_distance_percolators
    Area.create_polygon_percolators
  end

  def self.index_percolator(id, body)
    args = {
      index: self.__elasticsearch__.index_name,
      type: '.percolator',
      id: id,
      body: body,
    }
    self.__elasticsearch__.client.index(args)
  end
end
