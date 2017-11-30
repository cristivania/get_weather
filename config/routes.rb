Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  root 'users#new'
  get 'users/index'  => 'sessions#create'

  resources :users do
    resources :places
  end
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
