class Photo < ActiveRecord::Base
  belongs_to	:album
  #validations
  validates 	:album, presence: true
  # Photo uploader using carrierwave
  mount_uploader :image, PhotoUploader
end
