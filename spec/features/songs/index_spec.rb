require 'rails_helper'

RSpec.describe "Songs Index" do
  describe "As a visitor" do
    it "I see all song titles and play counts for an artist" do
      artist_1 = Artist.create!(name: 'Britney')
      artist_2 = Artist.create!(name: 'Madonna')
      song_1 = artist_1.songs.create!(title: "Hit Me Baby One More Time", length: 345, play_count: 10_000_000)
      song_2 = artist_2.songs.create!(title: "Madonna song", length: 345, play_count: 5)

      visit artist_songs_path(artist_1.id)

      within("#title") { expect(page).to have_content("All Songs for Britney") }
      within("#song-#{song_1.id}") do
        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
      end
      expect(page).to_not have_content(song_2.title)
      expect(page).to_not have_content("Play Count: #{song_2.play_count}")
    end

    it "I see all song titles and play counts" do
      artist_1 = Artist.create!(name: 'Britney')
      artist_2 = Artist.create!(name: 'Madonna')
      song_1 = artist_1.songs.create!(title: "Hit Me Baby One More Time", length: 345, play_count: 10_000_000)
      song_2 = artist_2.songs.create!(title: "Madonna song", length: 345, play_count: 10_000_000)

      visit songs_path

      within("#title") { expect(page).to have_content("All Songs") }
      within("#song-#{song_1.id}") do
        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
      end
      expect(page).to have_content(song_2.title)
      expect(page).to have_content("Play Count: #{song_2.play_count}")
    end
  end
end
