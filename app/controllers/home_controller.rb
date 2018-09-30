class HomeController < ApplicationController
    layout 'home'
  def index
    @ingressos = Ingresso.all
  end
end
