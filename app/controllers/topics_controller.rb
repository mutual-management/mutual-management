class TopicsController < ApplicationController
  def show; end
  def index
    @month = params[:month] || Time.zone.today.all_month
    @topics = Topic.where(month: @month)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.delete
  end
end
