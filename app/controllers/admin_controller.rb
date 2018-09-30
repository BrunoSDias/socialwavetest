class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def authenticate_admin!
    if cookies[:admin_login].blank?
      redirect_to admin_login_index_path
      return false
    end
    return true
  end

  def usuario
    if cookies[:admin_login].present?
      return @admin if @admin.present?
      @admin = Admin.find(JSON.parse(cookies[:admin_login])["id"])
      return @admin
    end
  end
end
