class ParkingSpace < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  belongs_to :vehicle_type
  
  validates_presence_of :amount_spaces
  validate :amount_spaces_greater_than_zero
  validate :user_is_valid
  validate :park_is_valid
  validate :vehicle_type_is_valid
  
  private
  
  def amount_spaces_greater_than_zero
    self.errors.add(:amount_spaces, "A quantidade de vagas deve ser informada.") if self.amount_spaces.to_i <= 0
  end
  
  # Valida a existência do usuário criador
  def user_is_valid
    self.errors.add(:user_id, "Usuário criador não cadastrado.") if User.all(:conditions => {:id => self.user_id}).count == 0
  end

  # Valida a existência do estacionamento inormado
  def park_is_valid
    self.errors.add(:park_id, "Estacionamento não cadastrado.") if Park.all(:conditions => {:id => self.park_id}).count == 0
  end

  # Valida a existência do tipo de veículo informado
  def vehicle_type_is_valid
    self.errors.add(:vehicle_type_id, "Tipo de veºiculo não cadastrado.") if VehicleType.all(:conditions => {:id => self.vehicle_type_id}).count == 0
  end
end
