class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => 'member'
    add_index :users, :role
  end
end
