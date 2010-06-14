require 'test_helper'

class ParkingSpaceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "deve ser possível criar novas instâncias" do
    assert create_parking_space.valid?
  end
  
  test "não pode estar relacionado a um park inválido" do
    ps = create_parking_space :park_id => 12341234
    assert ps.errors[:park_id]
  end
  
  test "não pode estar relacionado a um vehicle_type inválido" do
    ps = create_parking_space :vehicle_type_id => 12341234
    assert ps.errors[:vehicle_type_id]
  end
  
  test "não pode ter um usuário criador inválido" do
    ps = create_parking_space :user_id => 12341234
    assert ps.errors[:user_id]
  end
  
  test "não pode ter amount_spaces em branco" do
    ps = create_parking_space :amount_spaces => nil
    assert ps.errors[:amount_spaces]
  end
  
  test "não pode ter amount_spaces zerado" do
    ps = create_parking_space :amount_spaces => 0
    assert ps.errors[:amount_spaces]
  end
end
