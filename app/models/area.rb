class Area < ActiveRecord::Base
  include Concerns::Searchable

  mapping do
    indexes :id, type: 'string', index: 'not_analyzed'
    indexes :name, type: 'string', analyzer: 'kuromoji'
    indexes :location, type: 'geo_point'
  end

  def as_indexed_json(options = {})
    { 'id'       => id,
      'name'     => name,
      'location' => coordinates.first,
    }
  end

  serialize :coordinates

  def self.create_polygon_percolates
    Area.all.each do |area|
      args = {
        index: self.__elasticsearch__.index_name,
        type: '.percolator',
        id: "area-polygon-#{area.id}",
        body: {
          query: {
            filtered: {
              query: {
                match_all: {}
              },
              filter: {
                geo_polygon: {
                  location: {
                    points: area.coordinates
                  }
                }
              }
            }
          }
        }
      }
      self.__elasticsearch__.client.index(args)
    end
  end
end
