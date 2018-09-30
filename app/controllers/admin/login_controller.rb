class Admin::LoginController < ApplicationController
  layout 'admin'
  def index

  end

  def logar
    admin = Admin.login(params["login"])
    if admin.present?
      time = 1.year.from_now
      admin = admin.first
      value = {
        id: admin.id,
        email: admin.email
      }
      cookies[:admin_login] = { value: value.to_json, expires: time, httponly: true }
      redirect_to admin_index_path
    else
      flash[:erro] = "email ou senha inválidos"
      redirect_to admin_login_index_path
    end
  end

  def deslogar
    cookies[:admin_login] = nil
    redirect_to admin_login_index_path
  end
end
