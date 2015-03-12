class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string "category_title", default:"common"
    end
    add_index :categories, :category_title
  end
end
