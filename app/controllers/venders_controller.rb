class VendersController < ApplicationController

  def index
    @venders = Vender.all.page(params[:page]).per(5)
  end

  def new
    @vender = Vender.new
  end

  def show
    @vender = Vender.find(params[:id])
  end

  def create
    @vender = Vender.new(vender_params)
    if @vender.save!
      redirect_to root_path
    else 
      render :new
    end
  end

  def destroy
    @vender = Vender.find(params[:id])
    @vender.destroy
    redirect_to root_path
end

  private

  def vender_params
    params.require(:vender).permit(:title, :genre_id, :introduction, :residence, :image).merge(user_id: current_user.id)
  end

end
