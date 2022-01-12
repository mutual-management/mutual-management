class CalendarController < ApplicationController
  def index
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @schedules = Schedule.where(date: @month.all_month)
    puts @schedules
  end

  def show
    # TODO 選択した日付の日々の入力情報を取得なければ空白表示
    puts "showshow"
  end
end
