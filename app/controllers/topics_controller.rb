class TopicsController < ApplicationController
  def show; end
  def index
    @month = params[:month] || Date.current
    @topics = Topic.where(month: @month)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.delete
  end
end
