class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :t, :integer, :default => 0
  end
end
