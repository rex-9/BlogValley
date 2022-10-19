class User < ApplicationRecord
  def recent_posts
    Post.where(user_id: id).limit(3)
  end
end
