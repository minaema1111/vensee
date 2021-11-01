Rails.application.routes.draw do
  devise_for :users
  root to: 'venders#index'
  resources :venders do
  resources :comments, only: [:create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
