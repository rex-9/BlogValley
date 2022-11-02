class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :users, through: :likes, counter_cache: :likes_counter

  validates :title, presence: true,
                    length: { in: 3...250, too_short: 'Title must not be shorter than 3 characters.',
                              too_long: 'Title must not exceed 250 characters.' }
  validates :text, presence: true
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  def liked?(user_id)
    likes.where(user_id: user_id).exists?
  end

  def update_count(count)
    user.update(posts_counter: count)
  end
end
