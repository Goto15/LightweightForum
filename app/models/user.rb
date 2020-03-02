class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :feeds
    has_many :topics, through: :feeds
end
