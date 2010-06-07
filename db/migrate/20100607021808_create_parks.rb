class CreateParks < ActiveRecord::Migration
  def self.up
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.integer :creator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :parks
  end
end
