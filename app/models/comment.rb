class Comment < ApplicationRecord
  def counter
    post = Post.find_by(id: post_id)
    count = Comment.where(post_id: post.id).count
    post.update(comments_counter: count)
  end
end
