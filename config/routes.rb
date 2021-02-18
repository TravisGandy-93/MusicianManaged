Rails.application.routes.draw do
  resources :users
  resources :musicians
  resources :albums do
  resources :songs
  end 

  get '/' => 'sessions#welcome'
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
