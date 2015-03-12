class Category < ActiveRecord::Base
  has_many :albums,  :dependent => :destroy
  #TYPE_CATEGORY = %i[common adventure sport life]
end