class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :upvotes
      t.string :content

      t.timestamps
    end
  end
end
