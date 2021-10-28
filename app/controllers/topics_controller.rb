class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.find(1)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.delete
  end
end
