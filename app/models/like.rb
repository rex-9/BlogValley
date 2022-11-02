class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_count(count)
    post.update(likes_counter: count)
  end
end
