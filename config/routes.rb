Rails.application.routes.draw do
  get '/songs', to: 'songs#index', as: :songs
  get '/songs/:id', to: 'songs#show', as: :song

  get '/artists', to: 'artists#index', as: :artists
  get '/artists/new', to: 'artists#new', as: :new_artist
  post '/artists/new', to: 'artists#create'
  get '/artists/:id/edit', to: 'artists#edit', as: :edit_artist
  patch '/artists/:id', to: 'artists#update', as: :update_artist
  delete '/artists/:id/delete', to: 'artists#destroy', as: :delete_artist
end
