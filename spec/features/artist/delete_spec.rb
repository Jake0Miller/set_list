require 'rails_helper'

RSpec.describe 'Delete Artist' do
  describe 'When I visit the index page' do
    describe 'And I click the Delete button next to an Artist' do
    it 'It deletes an artist' do
      talking_heads = Artist.create(name: 'Talking Heads')

      visit artists_path

      click_link 'Delete'

      expect(current_path).to eq(artists_path)
      expect(page).to_not have_content(talking_heads.name)
      expect(page).to_not have_button('Delete')
    end
  end
end
end
