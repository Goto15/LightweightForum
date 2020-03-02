class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :feeds
    has_many :topics, through: :feeds

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { within: 4..30 }
    
end
