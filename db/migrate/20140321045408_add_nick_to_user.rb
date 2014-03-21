class AddNickToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string, :default => nil
  end
end
