class TopicsController < ApplicationController
  def show; end
  def index
    @topic = Topic.new
    @month = params[:month] || Time.zone.today.all_month
    @topics = Topic.where(month: @month)
  end

  def create
    @topic = Topic.create(topic_params)
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.delete
  end

  private

  def topic_params
    params.require(:topic).permit(:content, :month).merge(user_id: 1)
  end
end
