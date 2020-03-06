class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :posts
    has_many :feeds
    has_many :topics, through: :feeds

    validates :password, presence: true
    validates :username, presence: true, uniqueness: true, length: { within:4..30 }

    def self.most_comments
        User.all.max_by { |u| u.comments.count }
    end

    def self.most_posts
        User.all.max_by { |u| u.posts.count }
    end

    def self.most_topics_followed
        User.all.max_by { |u| u.topics.count }
    end

    def self.newest
        User.last
    end

    def self.oldest
        User.first
    end

    def self.user_analytics
        {
            most_comments: User.most_comments,
            most_posts: User.most_posts,
            most_topics: User.most_topics_followed,
            newest: User.newest,
            oldest: User.oldest
        }
    end

end
