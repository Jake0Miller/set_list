Rails.application.routes.draw do
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

  # get '/artists/:artist_id/songs/new', to: 'songs#new', as: :new_song
  # get '/artists/:artist_id/songs', to: 'songs#artist_songs', as: :artist_songs
  # post 'artists/:artist_id/songs', to: 'songs#create', as: :new_artist_song
end
