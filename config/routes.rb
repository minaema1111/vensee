Rails.application.routes.draw do
  devise_for :users
  root to: 'venders#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :venders, only: [ :index, :new, :create, :destroy]
end
