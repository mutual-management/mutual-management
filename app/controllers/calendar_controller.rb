class CalendarController < ApplicationController
  def index
    @schedule = Schedule.new
  end
end
