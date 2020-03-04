class VotesController < ApplicationController

    def upvote_post        
        @vote = Vote.new(user_id: session[:user_id].to_i, post_id: params[:id].to_i, opinion: 'up')
        # binding.pry
        if@vote.valid?
            vote.save
        else 
            Vote.all.select{ |vote| vote.user_id == session[:user_id].to_i && vote.post_id == params[:id].to_i && vote.comment_id == nil }.first.update(opinion: 'up')
        end

        if @vote.post_id != ""
            redirect_to post_path(@vote.post_id)
        else 
            redirect_to post_path(@vote.comment.post_id)
        end
    end

    def upvote_comment
        @vote = Vote.new(user_id: session[:user_id].to_i, comment_id: params[:id].to_i, opinion: 'up')
        # binding.pry
        if@vote.valid?
            @vote.save
        else 
            Vote.all.select{ |vote| vote.user_id == session[:user_id].to_i && vote.comment_id == params[:id].to_i && vote.post_id == nil }.first.update(opinion: 'up')
        end
        
        # if @vote.post_id != ""
        #     redirect_to post_path(@vote.post_id)
        # else 
            redirect_to post_path(Comment.find(@vote.comment_id).post_id)
        # end
    end

    def downvote
        @vote = Vote.custom_edit(params)
        if @vote.valid?
            @vote.save 
        end
        if @vote.post_id != ""
            redirect_to post_path(@vote.post)
        else redirect_to post_path(@vote.comment.post)
        end
    end

end
