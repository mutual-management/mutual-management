class DailyStacksController < ApplicationController
  before_action :set_daily_stack, only: %i[show update destroy]

  def index
    daily_stacks = current_user.daily_stacks.all
  end

  def new
    @date = Date.new(2021,11,4)
    @daily_stack = current_user.daily_stacks.build
    @expense_categories = current_user.expense_categories.active
  end

  def show
    @daily_stack
  end

  def create
    @daily_stack = current_user.daily_stacks.build(daily_stack_params)
    if @daily_stack.save
      flash[:success] = '登録が完了しました。'
      redirect_to new_daily_stack_path
    else
      flash[:danger] = '入力値が正しくありません。もう一度入力してください。'
      redirect_to new_daily_stack_path
    end
  end

  def update
    if @daily_stack.update(daily_stack_params)
      # サクセスメッセージ
    else
      # エラーメッセージ
    end
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
