require 'rails_helper'

RSpec.feature 'user index', type: :feature do
  background do
    @user = FactoryBot.create(:user, name: 'John Doe')
    visit root_path
  end

  scenario 'can see usernames' do
    expect(page).to have_content @user.name
  end

  scenario 'can see profile pictures' do
    expect(page).to have_selector('img[alt="profile picture"]')
  end

  scenario 'can see the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  scenario 'redirects to the user profile page' do
    click_on @user.name
    expect(current_path).to eq user_path(@user.id)
  end
end
