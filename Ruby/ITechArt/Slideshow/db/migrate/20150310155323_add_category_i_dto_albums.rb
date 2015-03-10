class AddCategoryIDtoAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :category_id, :integer , :default => '1'
    add_index :albums, :category_id
  end
end
