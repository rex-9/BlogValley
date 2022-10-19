class Post < ApplicationRecord
  def counter
    author = User.find_by(id: user_id)
    count = Post.where(user_id: author.id).count
    author.update(posts_counter: count)
  end

  def recent_comments
    Comment.where(post_id: id).limit(5)
  end
end
