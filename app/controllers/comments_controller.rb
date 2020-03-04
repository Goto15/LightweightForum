class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)

        if @comment.valid?
            @comment.save
            redirect_to post_path(@comment.post)
        else 
            redirect_to post_path(comment_params[:post_id])
        end
        
    end

    def upvote_comment
        @comment = find_comment
        @comment.upvote
        @comment.save
        redirect_to post_path(@comment.post)
    end

    private

    def find_comment
        Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:upvotes, :content, :user_id, :post_id)
    end
end
