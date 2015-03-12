require 'elasticsearch/model'

class Tag < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                query_string: { query: "name: *#{query}*" } },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    name: {}
                }
            }
        }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, index_options: 'offsets'
    end
  end
end

Tag.__elasticsearch__.client.indices.delete index: Tag.index_name rescue nil

Tag.__elasticsearch__.client.indices.create \
  index: Tag.index_name,
  body: { settings: Tag.settings.to_hash, mappings: Tag.mappings.to_hash }

Tag.import