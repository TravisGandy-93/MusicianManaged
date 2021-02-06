Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :musicians
  resources :users

  get '/' => 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
