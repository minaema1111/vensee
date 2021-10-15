class VendersController < ApplicationController
  def index
    @venders = Vender.all
  end

  def new
    @vender = Vender.new
  end

  def create
    @vender = Vender.new(vender_params)
    if @vender.save!
      redirect_to root_path
    else 
      render "new"
    end
  end

  private
  def vender_params
    params.require(:vender).permit(:title, :genre_id, :introduction, :residence, :image).merge(user_id: current_user.id)
  end

end
