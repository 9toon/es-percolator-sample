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

  def self.create_distance_percolates(radius: 1000)
    Station.all.each do |station|
      args = {
        index: self.__elasticsearch__.index_name,
        type: '.percolator',
        id: "station-distance-#{station.id}-#{radius}",
        body: {
          query: {
            filtered: {
              filter: {
                geo_distance: {
                  location: {
                    lat: station.lat,
                    lon: station.lon,
                  },
                  distance: "#{radius}meters",
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
