class Park < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :address
  validate :user_is_valid
  
  private
  
  # Valida a existência do usuário informado como criador do estacionamento
  def user_is_valid
    self.errors.add(:user_id, "Usuário criador não cadastrado.") if User.all(:conditions => {:id => self.user_id}).count == 0
  end
end
