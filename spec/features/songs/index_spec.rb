require 'rails_helper'

RSpec.describe "Songs Index" do
  describe "As a visitor" do
    it "I see all song titles and play counts" do
      artist_1 = Artist.create!(name: 'Britney')
      song_1 = artist_1.songs.create!(title: "Hit Me Baby One More Time", length: 345, play_count: 10_000_000)

      visit artist_songs_path(artist_1)

      within("#title") { expect(page).to have_content("All Songs for Britney") }
      within("#song-#{song_1.id}") do
        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
      end
    end
  end
end
