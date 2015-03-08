class AddVisibilityToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :visibility, :string
  end
end
