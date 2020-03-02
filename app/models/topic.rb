class Topic < ApplicationRecord
    has_many :feeds
    has_many :post_topics
    has_many :posts, through: :post_topics

    validates :name, uniqueness: true
    validates :name, presence: true
end
