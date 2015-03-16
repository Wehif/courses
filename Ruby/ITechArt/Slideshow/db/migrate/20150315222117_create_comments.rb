class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_nickname
      t.text :body
      t.integer :album_id
      t.references :parent, index:true

      t.timestamps null: false
    end
    add_foreign_key :comments, :albums
    add_foreign_key :comments, :comments
    add_index :comments, :user_nickname
    add_index :comments, :album_id
  end
end
