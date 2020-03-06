class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }

  after_initialize :init

  def self.most_upvotes
    Comment.all.max_by { |c| c.upvotes }
  end 

  def self.most_recent
    Comment.last
  end

  def self.comment_analytics
    {
      most_upvotes: Comment.most_upvotes,
      most_recent: Comment.most_recent
    }
  end

  def init
    self.upvotes ||= 0
  end

  def upvote 
    self.upvotes += 1
  end
end
