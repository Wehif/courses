class Album < ActiveRecord::Base
  belongs_to	:user
  has_many    :photos, :inverse_of => :album, :dependent => :destroy
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :photos, allow_destroy: true
  mount_uploader :image, PhotoUploader
end
