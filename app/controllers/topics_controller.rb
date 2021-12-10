class TopicsController < ApplicationController
  def show; end

  def index
    @topic = Topic.new
    @month = @topic.this_month(params[:month])
    @topics = Topic.where(month: @month).order(:id)
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path, flash: { blue: 'Topicを作成しました' }
    else
      @month = @topic.this_month(params[:month])
      @topics = Topic.where(month: @month)
      flash.now[:red] = 'Topicの作成に失敗しました'
      render :index
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(content: params[:content])
      redirect_to topics_path, flash: { blue: 'Topicを更新しました' }
    else
      flash.now[:red] = 'Topicの更新に失敗しました'
      render :index
    end
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
