class AddVisibilityToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :visibility, :string , :default => 'public'
    add_index :albums, :visibility
  end
end
