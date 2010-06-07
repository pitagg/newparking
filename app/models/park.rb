class Park < ActiveRecord::Base
  validates_presence_of :name, :address
  validate :creator_is_valid
  
  private
  
  # Valida a existência do usuário informado como criador do estacionamento
  def creator_is_valid
    self.errors.add(:creator_id, "Usuário criador não encontrado.") if User.all(:conditions => {:id => self.creator_id}).count == 0
  end
end
