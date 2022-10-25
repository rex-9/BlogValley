class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  validates :title, presence: true,
                    length: { in: 3...250, too_short: 'Title must not be shorter than 3 characters.',
                              too_long: 'Title must not exceed 250 characters.' }
  validates :text, presence: true
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
