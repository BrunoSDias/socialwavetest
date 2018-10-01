class HomeController < ApplicationController
    layout 'home'
  def index
    Time.zone='Brasilia'
    @ingressos = Ingresso.where(' data >= ?',Time.now )
  end
end
