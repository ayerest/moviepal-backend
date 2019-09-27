Rails.application.routes.draw do
  resources :genrepreferences
  get 'maps', to: 'maps#get_api_key'
  post 'maps', to: 'maps#get_map'
  post 'tomatoes', to: 'tomatoes#get_movies'
  post 'rottens', to: 'rottens#get_movie_info'
  resources :likes
  resources :genres
  resources :moviegenres
  resources :listmovies
  resources :preferences
  resources :movies
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
