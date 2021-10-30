class DailyStacksController < ApplicationController
  before_action :set_daily_stack, except: %i[index new create]

  def index
    daily_stacks = current_user.daily_stacks.all
  end

  def new
  end

  def show
    @daily_stack
  end

  def create
    daily_stack = current_user.daily_stacks.build(daily_stack_params)
    daily_stack.create
  end

  def update
    @daily_stack.update(daily_stack_params)
  end

  def destroy
    @daily_stack.destroy!
  end

  private

  def set_daily_stack
    @daily_stack = DailyStack.find(params[:id])
  end

  def daily_stack_params
    params.require(:daily_stack).permit(:title, :amount, :status, :date, :unit)
  end
end
