require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'Posts are indexed', type: :feature do
  background do
    @user = FactoryBot.create(:user)
    @post = Post.create(title: 'Title 1', text: 'Text 1', user_id: @user.id)
    @comment = Comment.create(text: 'BlaBlaBla', user_id: @user.id, post_id: @post.id)
    visit user_posts_path(user_id: @post.user.id)
  end

  scenario 'can see the profile picture' do
    expect(page).to have_selector('img[alt="profile picture"]')
  end

  scenario 'can see username' do
    expect(page).to have_content @post.user.name
  end

  scenario 'can see the number of posts the user has written' do
    expect(page).to have_content "Number of posts: #{@post.user.posts_counter}"
  end

  scenario 'can see first post title' do
    expect(page).to have_content(@user.posts[0].title)
  end

  scenario 'can see some of post body' do
    expect(page).to have_content(@user.posts[0].text)
  end

  scenario 'can see how the first comment is' do
    @user.posts.first.recent_comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end

  scenario 'can see how many comments the post has' do
    expect(page).to have_content("Comments: #{@user.posts[0].comments_counter}")
  end

  scenario 'can see how many likes the post has' do
    expect(page).to have_content("Likes: #{@user.posts[0].likes_counter}")
  end

  scenario 'redirects to the post show page' do
    @user.posts.each do |post|
      click_on post.title
      expect(current_path).to eq user_post_path(user_id: post.user.id, id: post.id)
    end
  end
end

# rubocop:enable Metrics/BlockLength
