class CalendarController < ApplicationController
  def index
    @schedule = Schedule.new
    # @month = @schedule.target_month(params[:month])
    # @schedules = Schedule.where(date: @month)
  end

  def show
    puts params[:targetDate]
  end
end
