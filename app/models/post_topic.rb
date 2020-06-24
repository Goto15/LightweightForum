class PostTopic < ApplicationRecord
    belongs_to :post
    belongs_to :topic

    validates :topic_id, presence: true
    validates :post_id, presence: true
end
