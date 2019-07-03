require 'rails_helper'

RSpec.describe 'New Artist' do
  describe 'When I visit the new artist form' do
    it 'I can create a new artist' do
      visit artists_path

      click_link 'New Artist'

      expect(current_path).to eq(new_artist_path)
      expect(page).to have_content('New Artist')

      fill_in 'Name', with: 'Megan'
      click_on 'Create Artist'

      expect(current_path).to eq(artists_path)
      expect(page).to have_content('Megan')
    end

    it 'I cannot create an artist without a name' do
      visit new_artist_path

      click_on 'Create Artist'

      expect(page).to have_content('Artist not created: Required information missing.')
      expect(page).to have_button('Create Artist')
      expect(current_path).to eq(new_artist_path)
    end
  end

end
