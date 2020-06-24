class Topic < ApplicationRecord
    has_many :feeds
    has_many :post_topics
    has_many :posts, through: :post_topics

    validates :name, uniqueness: true, presence: true

    def self.most_followers
        Topic.all.max_by { |t| t.feeds.count }
    end

    def self.topic_analytics
        {
            most_followers: Topic.most_followers
        }
    end
end
