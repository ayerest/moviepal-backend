Rails.application.routes.draw do
  resources :genres
  resources :moviegenres
  resources :listmovies
  resources :preferences
  resources :movies
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
