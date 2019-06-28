class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    if params[:artist_id].nil?
      @songs = Song.all
    else
      @artist = Artist.find(params[:artist_id])
      @songs = Song.all.select { |song| song.artist_id == @artist.id }
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.create!(song_params)
    redirect_to song_path(song)
  end

  private

  def song_params
    params.permit(:title, :length, :play_count)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
