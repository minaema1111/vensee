class VendersController < ApplicationController

  def index
    @venders = Vender.all
  end

  def new
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
    @vender = Vender.new

  end

  def create
    Vender.create(vender_params)
  end

  private


  def vender_params
    # params.require
  end
end
