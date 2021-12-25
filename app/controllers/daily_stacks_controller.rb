class DailyStacksController < ApplicationController
  before_action :set_daily_stack, only: %i[show update destroy]

  def index
    current_user = User.first # TODO ログイン機能が実装されたら削除する行
    daily_stacks = current_user.daily_stacks.all
  end

  def new
    @date = Date.new(2021,11,4)
    @daily_stack = current_user.daily_stacks.build
    @expense_categories = current_user.expense_categories.is_expense.active
  end

  def show
    @daily_stack
  end

  def create
    current_user = User.first # TODO ログイン機能が実装されたら削除する行
    @daily_stack = current_user.daily_stacks.build(daily_stack_params)
    @daily_stack.save! # TODO エラーハンドリング未実装
    redirect_to :root
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
    params.require(:daily_stack).permit(:title, :amount, :status, :date, :unit, :expense_category_id)
  end
end
