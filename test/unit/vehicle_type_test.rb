require 'test_helper'

class VehicleTypeTest < ActiveSupport::TestCase
  test "deve ser possível criar novas instâncias" do
    assert create_vehicle_type.valid?
  end
  
  test "não pode ter nome em branco" do
    vt = create_vehicle_type :name => nil
    assert vt.errors[:name]
  end
  
  test "não pode conter um usuário criador inválido" do
    vt = create_vehicle_type :user_id => 123456789
    assert vt.errors[:user_id]
  end
end
