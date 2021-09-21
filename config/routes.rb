Rails.application.routes.draw do

  resources :user, only: [:create]

  post '/signup', to: 'users#create'

  get '/me', to: 'users#me'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
