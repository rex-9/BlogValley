class AddLikesCounterAndCommentsCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_counter, :integer
    add_index :posts, :likes_counter
    add_column :posts, :comments_counter, :integer
    add_index :posts, :comments_counter
  end
end
