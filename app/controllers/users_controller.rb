class UsersController < ApplicationController
    before_action :authorized, only: [:show]
    
    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def create
        # params[:user][:topic_ids].shift
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to edit_user_path(@user)
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
        if current_user == @user
            @posts = @user.posts
        else
            redirect_to login_path
        end

        @feed = Feed.new
        

    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, topic_ids: [])
    end

end