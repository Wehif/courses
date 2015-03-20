class Comment < ActiveRecord::Base
  belongs_to :album
  has_many :childs, class_name: "Comment", foreign_key: "comment_id"
  belongs_to :parent, class_name: "Comment"
end
