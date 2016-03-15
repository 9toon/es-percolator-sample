class Station < ActiveRecord::Base
  def self.create_distance_percolators(radius: 1000)
    Station.all.each do |station|
      id = "station-distance-#{station.id}-#{radius}"
      body = {
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
      Spot.index_percolator(id, body)
    end
  end
end
