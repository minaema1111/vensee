Rails.application.routes.draw do
  root to: 'venders#index'
  resources :venders, only: [ :index, :new, :create]
end
