class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @marcas = Marca.joins(:modelos).distinct.order(:nome)
  end
end
