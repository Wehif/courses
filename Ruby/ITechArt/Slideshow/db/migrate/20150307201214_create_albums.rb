class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string   "title",       null: false
      t.text     "description"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
