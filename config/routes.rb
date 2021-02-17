Rails.application.routes.draw do
  resources :users
  resources :musicians
  resources :albums
  resources :songs

  get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get "/albums/:id/songs/new" => 'songs#new'
  post "/albums/:id/songs/new" => 'songs#create'
  
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
