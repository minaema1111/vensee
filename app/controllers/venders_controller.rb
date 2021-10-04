class VendersController < ApplicationController
  def index
    @venders = Vender.all
  end
end
