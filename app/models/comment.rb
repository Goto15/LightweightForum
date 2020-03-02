class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { less_than_or_equal_to: 1000 }
end
