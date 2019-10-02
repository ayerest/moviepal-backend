Rails.application.routes.draw do
  resources :genrepreferences
  get 'maps', to: 'maps#get_api_key'
  post 'maps', to: 'maps#get_map'
  post 'tomatoes', to: 'tomatoes#get_movies'
  post 'rottens', to: 'rottens#get_movie_user_like_record'
  post 'genres', to: 'genres#create'
  post 'markers', to: 'markers#get_markers'
  post 'theaters', to: 'theaters#get_theater_info'
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post 'notifications', to: 'notifications#send_sms'
  patch 'likes', to: 'likes#update'
  resources :likes
  resources :genres
  resources :moviegenres
  resources :listmovies
  resources :preferences
  resources :movies
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
