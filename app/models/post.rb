class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_topics
  has_many :topics, through: :post_topics
  has_many :comments

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 5000 }

  after_initialize :init

  # Class Methods
  def self.construct_feed(topics:, sort: )
    if !sort
      sort = 'Creation'
    end

    posts = Post.all.select do |post|
      if !(post.topics & topics).empty?
        post
      end
    end

    case sort
    when 'Creation'
      posts.sort_by! do |post|
        post.created_at
      end.reverse!
    when 'Popularity'
      posts.sort_by! do |post| 
        post.upvotes
      end.reverse!
    end
  end

  # Instance Methods
  def init
    self.upvotes ||= 0
  end

  def upvote
    self.upvotes += 1
  end

end
