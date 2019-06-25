require 'rails_helper'

RSpec.describe "Songs Index" do
  describe "As a visitor" do
    it "I see all song titles and play counts" do
      artist_1 = Artist.create!(name: 'Britney')
      artist_2 = Artist.create!(name: 'Haddaway')
      song_1 = artist_1.songs.create!(title: "Hit Me Baby One More Time", length: 345, play_count: 10_000_000)
      song_2 = artist_2.songs.create!(title: "What Is Love", length: 543, play_count: 2)

      visit songs_path

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to have_content("Play Count: #{song_1.play_count}")
      expect(page).to have_content("Play Count: #{song_2.play_count}")
    end
  end
end
