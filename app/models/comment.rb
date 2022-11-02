class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  def update_count(count)
    post.update(comments_counter: count)
  end
end
