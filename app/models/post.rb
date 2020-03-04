class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_topics
  has_many :topics, through: :post_topics
  has_many :comments

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 5000 }

  after_initialize :init

  def init
    self.upvotes ||= 0
  end

  def vote_score
   (Vote.select{ |vote| vote.post_id == self.id && vote.opinion == 'up' }.count - Vote.select{ |vote| vote.post_id == self.id && vote.opinion == 'down' }.count).to_i
  end

end
