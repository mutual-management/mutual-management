class CalendarController < ApplicationController
  def index
    @schedule = Schedule.new
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @schedules = Schedule.where(date: @month.all_month)
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @schedules }
    end
  end

  def show
    # TODO 選択した日付の日々の入力情報を取得なければ空白表示
  end
end
