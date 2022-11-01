require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  background do
    @user = FactoryBot.create(:user, name: 'John Doe')
    visit user_path(@user.id)
  end

  scenario 'can see profile pictures' do
    expect(page).to have_selector('img[alt="profile picture"]')
  end

  scenario 'can see username' do
    expect(page).to have_content @user.name
  end

  scenario 'can see the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  scenario 'can see user bio' do
    expect(page).to have_content @user.bio
  end

  scenario 'can see the first 3 posts of the user' do
    @user.recent_posts.each do |post|
      expect(page).to have_content post.text
    end
  end

  scenario 'can see See More Button to see all posts of the user' do
    expect(find_link("See more")).to be_visible
  end

  # scenario 'redirects to the post show page' do
  #   click_link @user.id.to_s
  #   expect(current_path).to eq user_path(@user.id)
  # end

  # scenario 'redirects to the posts index page' do
  #   click_link @user.id.to_s
  #   expect(current_path).to eq user_path(@user.id)
  # end
end
