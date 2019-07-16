Rails.application.routes.draw do
  root 'welcome#index'
  # get '/songs', to: 'songs#index', as: :songs
  # get '/songs/:id', to: 'songs#show', as: :song

  # get '/artists', to: 'artists#index', as: :artists
  # get '/artists/new', to: 'artists#new', as: :new_artist
  # post '/artists/new', to: 'artists#create'
  # get '/artists/:id/edit', to: 'artists#edit', as: :edit_artist
  # patch '/artists/:id', to: 'artists#update', as: :update_artist
  # delete '/artists/:id/delete', to: 'artists#destroy', as: :delete_artist
  resources :songs, only: [:index, :show]
  resources :artists, except: :show do
    resources :songs, only: [:new, :create, :index]
  end
  resources :users, only: [:new, :create, :show]

  get '/playlists', to: 'playlists#index'
  patch '/cart/:song_id', to: 'carts#add_song', as: :cart
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  namespace :admin do
    resources :articles, only: [:new, :create, :destroy]
  end
  
  resources :article, only: [:show, :index]

  # get '/artists/:artist_id/songs/new', to: 'songs#new', as: :new_song
  # get '/artists/:artist_id/songs', to: 'songs#artist_songs', as: :artist_songs
  # post 'artists/:artist_id/songs', to: 'songs#create', as: :new_artist_song
end
