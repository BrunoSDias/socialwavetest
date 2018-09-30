class HomeController < ApplicationController
    layout 'application'
  def index
    @ingressos = Ingresso.all
  end
end
