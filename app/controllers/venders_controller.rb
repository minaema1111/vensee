class VendersController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @venders = Vender.page(params[:page]).per(6)
  end

  def new
    @vender = Vender.new
  end

  def show
    @vender = Vender.find(params[:id])
    @user = @vender.user
    @comment = Comment.new
  end

  def create
    @vender = Vender.new(vender_params)
    if @vender.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    vender = Vender.find(params[:id])
    if vender.destroy
      redirect_to root_path
    else
      render :new
  end
end

  def edit
    @vender = Vender.find(params[:id])
  end

  def update
    vender = Vender.find(params[:id])
    if vender.update(vender_params)
      redirect_to vender_path(vender.id)
    else
      render 'edit'
    end
  end

  private

  def vender_params
    params.require(:vender).permit(:title, :genre_id, :introduction, :residence, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @vender = Vender.find(params[:id])
    redirect_to root_path unless current_user == @vender.user
end
end
