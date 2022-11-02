require 'rails_helper'

RSpec.feature 'Posts are indexed', type: :feature do
  background do
    @user = FactoryBot.create(:user)
    @post = Post.create(title: 'Title 1', text: 'Text 1', user_id: @user.id)
    @comment = Comment.create(text: 'BlaBlaBla', user_id: @user.id, post_id: @post.id)
    visit user_posts_path(user_id: @post.user.id)
  end

  scenario 'can see the PROFILE PICTURE, USERNAME and the NUMBER OF POSTS the user has published' do
    expect(page).to have_selector('img[alt="profile picture"]')
    expect(page).to have_content @post.user.name
    expect(page).to have_content "Number of posts: #{@post.user.posts_counter}"
  end

  scenario 'can see the TITLE and the BODY of the first post' do
    expect(page).to have_content(@user.posts[0].title)
    expect(page).to have_content(@user.posts[0].text)
  end

  scenario 'can see how the FIRST COMMENT is' do
    @user.posts.first.recent_comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end

  scenario 'can see how many COMMENTS and LIKES the post has' do
    expect(page).to have_content("Comments: #{@user.posts[0].comments_counter}")
    expect(page).to have_content("Likes: #{@user.posts[0].likes_counter}")
  end

  scenario 'REDIRECTS to the POST SHOW page' do
    @user.posts.each do |post|
      click_on post.title
      expect(current_path).to eq user_post_path(user_id: post.user.id, id: post.id)
    end
  end
end
