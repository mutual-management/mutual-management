class CalendarController < ApplicationController
  def index
    @schedule = Schedule.new
    # @month = @schedule.target_month(params[:month])
    # @schedules = Schedule.where(date: @month)
  end

  def show
    # TODO 選択した日付の日々の入力情報を取得なければ空白表示
    puts params[:targetDate]
  end
end
