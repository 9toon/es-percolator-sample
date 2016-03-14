class Spot < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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
end
