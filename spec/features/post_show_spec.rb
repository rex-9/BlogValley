require 'rails_helper'

RSpec.feature 'Posts show page', type: :feature do
  background do
    @user = FactoryBot.create(:user, name: 'John Smith')
    @post = FactoryBot.create(:post, comments_counter: 3, user: @user)
    visit user_post_path(user_id: @user.id, id: @post.id)
  end

  scenario 'can see post title' do
    expect(page).to have_content @post.title
  end

  scenario 'can see author name' do
    expect(page).to have_content('John Smith')
  end

  scenario 'can see the number of comments' do
    expect(page).to have_content "Comments: #{@post.comments_counter}"
  end

  scenario 'can see the number of likes' do
    expect(page).to have_content "Likes: #{@post.likes_counter}"
  end

  scenario 'can see the post body' do
    expect(page).to have_content @post.text
  end

  scenario 'can see the commenter' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.user.name
    end
  end

  scenario 'can see the content of commenter' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
