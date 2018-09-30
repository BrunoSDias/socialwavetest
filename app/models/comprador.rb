class Comprador < ApplicationRecord
  has_many :pedidos, class_name: "Pedido"

  validates :nome, presence: true
  validates :email, presence: true
  validates :telefone, presence: true
  validates :senha, presence: true

  def self.login(login)
    Comprador.where(email: login["email"], senha: login["senha"])
  end
end
