class AddFieldsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, null: false, default: ""
    add_column  :users, :remember_me, :boolean,  null: false, default: false
    add_column :users, :provider, :string
    add_column :users, :url, :string

    add_index :users, :nickname,     :unique => true
  end
end
