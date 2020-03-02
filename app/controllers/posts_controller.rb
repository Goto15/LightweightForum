class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = find_post
    end

    def new
        @post = Post.new
    end

    def edit
        @post = find_post
    end

    def create
        @post = Post.new(post_params)

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            puts @post.errors.full_messages
            redirect_to :action => "new"
        end
    end

    def update
        @post = find_post
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private 

    def find_post
        Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end