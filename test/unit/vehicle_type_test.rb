require 'test_helper'

class VehicleTypeTest < ActiveSupport::TestCase
  def create_vehicle_type(data={})
    data = {:name => "Carro de passeio"}.merge(data)
    VehicleType.create(data)
  end
  test "deve ser possível criar novas instâncias" do
    assert create_vehicle_type.valid?
  end
  
  test "nome não pode estar em branco" do
    vt = create_vehicle_type :name => nil
    assert vt.errors[:name]
  end
end
