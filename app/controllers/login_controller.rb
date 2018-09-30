class LoginController < ApplicationController
  def index

  end

  def logar
    comprador = Comprador.login(params["login"])
    if comprador.present?
      time = 1.year.from_now
      comprador = comprador.first
      value = {
        id: comprador.id,
        nome: comprador.nome,
        email: comprador.email
      }
      cookies[:comprador_login] = { value: value.to_json, expires: time, httponly: true }

      redirect_to root_path
    else
      flash[:erro] = "email ou senha inválidos"
      redirect_to login_index_path
    end
  end

  def deslogar
    cookies[:comprador_login] = nil
    redirect_to root_path
  end
end
