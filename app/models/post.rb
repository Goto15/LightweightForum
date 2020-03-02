class Post < ApplicationRecord
  has_many :post_topics
  has_many :topics, through: :post_topics
  has_many :comments
  belongs_to :user
end
