Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :musicians
  resources :users

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
