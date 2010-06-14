class AddUserIdToPark < ActiveRecord::Migration
  def self.up
    add_column :parks, :user_id, :integer
    remove_column :parks, :creator_id
  end

  def self.down
    remove_column :parks, :user_id
    add_column :parks, :creator_id, :integer
  end
end
