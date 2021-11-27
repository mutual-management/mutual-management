class TopicsController < ApplicationController
  def show; end

  def index
    @topic = Topic.new
    @month = if params[:month]
      day = params[:month].to_date
      month_firstday = day.beginning_of_month
      month_lastday = day.to_date.end_of_month
      Range.new(month_firstday, month_lastday)
    else
      Time.zone.today.all_month
    end
    @topics = Topic.where(month: @month)
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path, flash: { blue: 'Topicを作成しました' }
    else
      @month = if params[:month]
        day = params[:month].to_date
        month_firstday = day.beginning_of_month
        month_lastday = day.to_date.end_of_month
        Range.new(month_firstday, month_lastday)
      else
        Time.zone.today.all_month
      end
      @topics = Topic.where(month: @month)
      flash.now[:red] = 'Topicの作成に失敗しました'
      render :index
    end
  end

  def update
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
