class Area < ActiveRecord::Base
  include Concerns::Searchable

  serialize :coordinates

  def self.create_polygon_percolates
    Area.all.each do |area|
      args = {
        index: Spot.__elasticsearch__.index_name,
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
