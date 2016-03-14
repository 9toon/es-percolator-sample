class Station < ActiveRecord::Base
  include Concerns::Searchable

  def self.create_distance_percolates(radius: 1000)
    Station.all.each do |station|
      args = {
        index: Spot.__elasticsearch__.index_name,
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
