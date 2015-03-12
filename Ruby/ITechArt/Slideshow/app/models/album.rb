class Album < ActiveRecord::Base
  belongs_to	:user
  has_many    :photos, :inverse_of => :album, :dependent => :destroy
  belongs_to  :category
  validates 	:category, presence: true
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :photos, allow_destroy: true
  VISIBILITY = %i[private public]
  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
