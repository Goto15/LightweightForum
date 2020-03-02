class User < ApplicationRecord
    has_many :comments, :posts, :feeds
    has_many :topics, through: :feeds
end
