Rails.application.routes.draw do
  resource :users
  resources :places
  root 'users#new'


  get '/login' => 'sessions#new', as: 'login'
  get 'users/index'  => 'users#index', as: "dashboard"
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
