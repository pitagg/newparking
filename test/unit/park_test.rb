require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  test "deve ser possível criar novas instâncias" do
    park = create_park
    assert park.valid?
  end
  
  test "não pode conter um usuário criador inválido" do
    park = create_park :user_id => 123456789
    assert park.errors[:user_id]
  end
  
  test "não pode ter nome em branco" do
    park = create_park :name => nil
    assert park.errors[:name]
  end
  
  test "não pode ter endereço em branco" do
    park = create_park :address => nil
    assert park.errors[:address]
  end
end
