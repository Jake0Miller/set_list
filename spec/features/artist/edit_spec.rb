require 'rails_helper'

RSpec.describe 'Edit Artist' do
  describe 'As a visitor' do
    describe 'When I visit the artists index' do
      it 'I can update an artist' do
        beatles = Artist.create(name: 'Beatles')

        visit artists_path

        click_link 'Edit'

        expect(current_path).to eq(edit_artist_path(beatles))

        fill_in 'Name', with: 'The Beatles'
        click_on 'Create Artist'

        expect(current_path).to eq(artists_path)
        expect(page).to have_content('The Beatles')
      end
    end
  end
end
