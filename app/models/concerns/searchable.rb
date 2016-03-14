module Concerns
  module Searchable
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      index_name "#{Rails.env}-#{Rails.application.class.to_s.downcase}-#{self.name.downcase}"
    end
  end
end
