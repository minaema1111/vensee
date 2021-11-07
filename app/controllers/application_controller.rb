class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :create_searching_object


  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def search
    # @venders = Vender.search(params[:search])
    # method = params[:search_method]
    # word = params[:search_word]
    # @p = Vender.search(method,word)
    # @p = Vender.search(:residence_cont => params[:q][:search])
    @results = @p.result
  end

  private
  def create_searching_object
    # genre_idが1の場合は検索条件から外す
    if params[:q].present? && params[:q][:genre_id_eq] == "1"
      params[:q][:genre_id_eq] = ''
    end

    @p = Vender.ransack(params[:q])
  end
end
