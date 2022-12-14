class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  , :confirmable
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false,
                   format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts(limit = 3)
    posts.includes(:comments).last(limit)
  end

  def admin?
    role == 'admin'
  end
end
