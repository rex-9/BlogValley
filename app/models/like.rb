class Like < ApplicationRecord
  def counter
    post = Post.find_by(id: self.post_id)
    count = Like.where(post_id: post.id).count
    post.update(likes_counter: count)
  end
end