class AddUpvotesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :upvotes, :integer
  end
end
