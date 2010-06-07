require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  # Cria um estacionamento válido
  def create_park(data={})
    data = {:name => "Meu estacionamento", :address => "Planeta Terra", :creator_id => users(:pita).id}.merge(data)
    Park.create data
  end
  
  test "deve ser possível criar novas instâncias" do
    park = create_park
    assert park.valid?
  end
  
  test "criador deve ser um usuário válido" do
    park = create_park :creator_id => 123456789
    assert park.errors[:creator_id]
  end
  
  test "nome não pode estar em branco" do
    park = create_park :name => nil
    assert park.errors[:name]
  end
  
  test "endereço não pode estar em branco" do
    park = create_park :address => nil
    assert park.errors[:address]
  end
end
