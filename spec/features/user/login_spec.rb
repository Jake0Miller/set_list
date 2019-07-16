require 'rails_helper'

RSpec.describe 'User login form' do
  it 'logs in a user' do
    user = User.create(user_name: 'funbucket13', password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)
    fill_in :user_name, with: user.user_name
    fill_in :password, with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.user_name}")
    expect(page).to have_link('Log out')

    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You have been logged out.")
  end
end
