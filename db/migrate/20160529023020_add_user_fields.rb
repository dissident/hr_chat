class AddUserFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integer, default: 0
    add_column :users, :open, :boolean, default: false
    add_column :users, :opener, :integer
    add_column :users, :allowed, :integer, array: true

    add_index :users, :allowed, using: 'gin'
  end
end
