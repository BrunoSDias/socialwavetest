class Comprador < ApplicationRecord

  def self.login(login)
    Comprador.where(email: login["email"], senha: login["senha"])
  end
end
