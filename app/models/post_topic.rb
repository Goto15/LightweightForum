class PostTopic < ApplicationRecord
    belongs_to :post, :user
end
