class AddUserIdToVehicleType < ActiveRecord::Migration
  def self.up
    add_column :vehicle_types, :user_id, :integer
  end

  def self.down
    remove_column :vehicle_types, :user_id
  end
end
