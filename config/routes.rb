Rails.application.routes.draw do
  root to: 'venders#index'
  post 'set_cities', to: 'cities#set_cities'
  resources :venders, only: [ :index, :new, :create]
end
