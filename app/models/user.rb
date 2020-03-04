class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :posts
    has_many :feeds
    has_many :topics, through: :feeds

    validates :password, presence: true
    validates :username, presence: true, uniqueness: true, length: { within:4..30 }
    
end
