class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? 
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :create_searching_object

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def search
    @results = @p.result
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  def create_searching_object
    if params[:q].present? && params[:q][:genre_id_eq] == '1'
      params[:q][:genre_id_eq] = ''
    end

    @p = Vender.ransack(params[:q])
  end
end
