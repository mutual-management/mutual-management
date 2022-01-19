class CalendarController < ApplicationController
  def index
    @schedule = Schedule.new
    @targetDate = params[:target_date] ? Date.parse(params[:target_date]) : Time.zone.today
    @schedules = Schedule.where(date: @targetDate.all_month)
    @daily_schedules = Schedule.new
    @daily_stacks = DailyStack.new
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @schedules }
    end
  end

  def show
    @targetDate = params[:target_date] ? Date.parse(params[:target_date]) : Time.zone.today
    @daily_schedules = Schedule.where(date: @targetDate.all_day)
    @daily_stacks = DailyStack.where(date: @targetDate.all_day)
    html = render_to_string partial: 'calendar/daily_schedule', locals: { daily_schedules: @daily_schedules }
    render json: { html: html }
    # respond_to do |format|
    #   format.json { render json: { daily_schedules: @daily_schedules, daily_stacks: @daily_stacks } }
    # end
  end
end
