class PlaylistsController < ApplicationController
  #before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  # private
  #
  # def playlist_params
  #   params.permit(:name)
  # end
  #
  # def set_playlist
  #   @playlist = Playlist.find(params[:id])
  # end
end
