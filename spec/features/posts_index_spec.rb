require 'rails_helper'

RSpec.feature 'Posts are indexed', type: :feature do
  background do
    @user = User.create(name: 'Rex', photo: 'https://images.unsplash.com/photo-1649194791397-90dddfe2c1c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80', bio: 'Spiritual Full Stack Developer')
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

  # scenario 'can see the pagination' do

  # end

  # scenario 'redirects to the post show page' do

  # end
end
