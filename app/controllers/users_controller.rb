class UsersController < ApplicationController

    def index
        @users = User.all 
    end

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
    end

    def edit
        @user = find_user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else 
            render :edit
        end
    end

    def feed
        @user = find_user
        
    end

    private

    def find_user
        User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, topic_ids: [])
    end


end