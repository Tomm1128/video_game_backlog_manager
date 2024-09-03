require 'rails_helper'

RSpec.feature "User login", type: :feature do
  # let!(:user) { User.create!(username: 'testuser', password: 'password123', password_confirmation: 'password123', bio: 'A gamer.') }

  scenario 'with valid credentials' do
    user = create(:user)

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
  end

  scenario 'with invalid credentials' do
    user = create(:user)

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid username or password.')
    expect(page).to have_current_path(login_path)
  end
end
