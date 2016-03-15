class Area < ActiveRecord::Base
  serialize :coordinates

  def self.create_polygon_percolators
    Area.all.each do |area|
      id = "area-polygon-#{area.id}"
      body = {
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
      Spot.index_percolator(id, body)
    end
  end
end
