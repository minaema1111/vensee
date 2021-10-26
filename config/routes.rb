Rails.application.routes.draw do
  devise_for :users
  root to: 'venders#index'
  resources :venders
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
