class Song < ApplicationRecord
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  belongs_to :artist
  validates_presence_of :title, :length

  def self.song_count
    Song.all.length
  end
end
