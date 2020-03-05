class UsersController < ApplicationController
    before_action :authorized, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = find_user
        @topics = @user.topics
    end

    def edit
        @user = find_user
    end

    def update
        @user = find_user

        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def login
        @user = find_user
    end

    def feed
        @user = find_user
        @sorts = sort_methods
        @sort = params[:sorting]

        if @sort
            @sort_method = @sort[:method]
        end

        if current_user == @user
            @posts = Post.construct_feed(topics: @user.topics, sort: @sort_method)
        else
            redirect_to login_path
        end
    end

    private

    def find_user
        User.find(params[:id])
    end

    def sort_methods
        ['Popularity', 'Creation']
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, topic_ids: [])
    end

end