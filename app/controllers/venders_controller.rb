class VendersController < ApplicationController

  def index
    @venders = Vender.all
  end

  def new
    @vender = Vender.new
  end

  def create
  end
end
