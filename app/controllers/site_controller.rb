class SiteController < ApplicationController
  before_action :authenticate_comprador!

  def authenticate_comprador!
    if cookies[:comprador_login].blank?
      redirect_to login_index_path
      return false
    end
    return true
  end

  def usuario
    if cookies[:comprador_login].present?
      return @comprador if @comprador.present?
      @comprador = Comprador.find(JSON.parse(cookies[:comprador_login])["id"])
      return @comprador
    end
  end
end
