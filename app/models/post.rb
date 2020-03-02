class Post < ApplicationRecord
  has_many :post_topics
  has_many :topics, through: :post_topics
  has_many :comments
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 5000 }
end