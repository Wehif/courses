require 'elasticsearch/model'

class Album < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to	:user
  has_many    :photos, :inverse_of => :album, :dependent => :destroy
  belongs_to  :category
  validates 	:category, presence: true
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :photos, allow_destroy: true
  VISIBILITY = %i[private public]
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                query_string: { query: "title: *#{query}* OR description: *#{query}*" } },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    title: {},
                    description: {}
                }
            }
        }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, index_options: 'offsets'
      indexes :description, index_options: 'offsets'
    end
  end

end

# Delete the previous albums index in Elasticsearch
Album.__elasticsearch__.client.indices.delete index: Album.index_name rescue nil

# Create the new index with the new mapping
Album.__elasticsearch__.client.indices.create \
  index: Album.index_name,
  body: { settings: Album.settings.to_hash, mappings: Album.mappings.to_hash }

# Index all albums records from the DB to Elasticsearch
Album.import


