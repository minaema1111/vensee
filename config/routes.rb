Rails.application.routes.draw do
  devise_for :users
  root to: 'venders#index'
  resources :venders, only: :index
end
