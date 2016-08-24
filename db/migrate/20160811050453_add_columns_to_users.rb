class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :nickname, :string
    add_column :users, :character, :string
    add_column :users, :deadline, :integer
    add_column :users, :point, :integer, default: 0
    add_column :users, :level, :integer, default: 0
    add_column :users, :add_point, :integer, default: 0
  end
end
