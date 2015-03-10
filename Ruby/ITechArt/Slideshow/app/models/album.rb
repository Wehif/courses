class Album < ActiveRecord::Base
  belongs_to	:user
  has_many    :photos, :inverse_of => :album, :dependent => :destroy
  belongs_to  :category
  validates 	:category, presence: true
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :photos, allow_destroy: true
  #accepts_nested_attributes_for :category, allow_destroy: true
  VISIBILITY = %i[private public]
  #delegate :category_title, to: :category
end
