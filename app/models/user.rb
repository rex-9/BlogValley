class User < ApplicationRecord
  def recent_posts
    Post.where(user_id: self.id).limit(3)
  end
end