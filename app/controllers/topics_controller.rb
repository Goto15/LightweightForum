class TopicsController < ApplicationController

    def index
        @topics = Topic.all 
    end

    def show
        @topic = find_topic
        @posts = @topics.posts
    end

    private

    def find_topic
        Topic.find(params[:id])
    end
end