Elasticsearch::Model.client = Elasticsearch::Client.new host: 'localhost', trace: Rails.env.development?
