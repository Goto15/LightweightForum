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

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
