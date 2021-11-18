class TopicsController < ApplicationController
  def show; end

  def index
    @topic = Topic.new
    if params[:month]
      day = params[:month].to_date
      month_firstday = day.beginning_of_month
      month_lastday = day.to_date.end_of_month
      @month = Range.new(month_firstday, month_lastday)
    else
      @month = Time.zone.today.all_month
    end
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
