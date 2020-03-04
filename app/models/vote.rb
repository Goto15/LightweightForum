class Vote < ApplicationRecord
    validates :user_id, presence: true 
    validates :user_id, uniqueness: { scope: :post_id }
    validates :user_id, uniqueness: { scope: :comment_id }
    validates :opinion, inclusion: { in: %w(up down none) }
    # validate :has_post_or_comment
    
    # def has_post_or_comment
    #     if post_id == "" && comment_id == ""
    #         errors.add(:post_id, "must be associated to a post or comment")
    #         errors.add(:comment_id, "must be associated to a post or comment")
    #     elsif post_id != "" && comment_id != ""
    #         errors.add(:post_id, "cannot be associated to a post and comment")
    #         errors.add(:comment_id, "cannot be associated to a post and comment")
    #     end
    # end

    def comment_vote(user, comment, opinion)
        vote = Vote.find_or_create_by(user_id: user, comment_id: comment )
        vote.update(opinion: opinion)
    end

    def post_vote(user, post, opinion)
        vote = Vote.find{ |vote| vote.user_id == user && vote.post_id == post}
        if vote
            vote.update(opinion: opinion)
        else Vote.create(user_id: user, post_id: post, opinion: opinion)
        end

    end

end
