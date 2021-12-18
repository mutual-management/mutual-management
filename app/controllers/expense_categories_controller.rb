class ExpenseCategoriesController < ApplicationController

  before_action :set_expense_category, only: %i[update]

  def new
  end

  def create
    current_user = User.first # ログイン機能が実装されたら削除する行
    @expense_category = current_user.expense_categories.create(expense_category_params)
    @expense_category.save! # エラーハンドリング未実装
    render json: @expense_category
  end

  def update
    @expense_category.update!(expense_category_params)
  end

  private

  def set_expense_category
    @expense_category = ExpenseCategory.find(params[:id])
  end

  def expense_category_params
    params.require(:expense_category).permit(:title, :delete_flag, :user_id)
  end
end
