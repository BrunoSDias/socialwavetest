class Admin < ApplicationRecord

  def self.login(login)
    Admin.where(email: login["email"], senha: login["senha"])
  end
end
