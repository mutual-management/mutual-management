class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.find(1)
  end
end
