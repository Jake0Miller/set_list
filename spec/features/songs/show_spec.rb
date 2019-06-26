require 'rails_helper'

RSpec.describe "Songs Show" do
  describe 'a user visits a song show page' do
    it 'user sees that song with title and artist' do
      talking_heads = Artist.create!(name: 'Talking Heads')
      she_was = talking_heads.songs.create(title: 'And She Was', length: 234)
      wild_life = talking_heads.songs.create(title: 'Wild Wild Life', length: 456, play_count: 0)

      visit song_path(she_was)

      expect(page).to have_content(she_was.title)
      expect(page).to have_content("By: #{talking_heads.name}")
      expect(page).to_not have_content(wild_life.title)
    end
  end
end
