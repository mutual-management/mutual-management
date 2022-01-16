class ExpenseCategoriesController < ApplicationController

  before_action :set_expense_category, only: %i[update]

  def new
  end

  def create
    @expense_category = current_user.expense_categories.create(expense_category_params)
    if @expense_category.save
      render json: @expense_category
    else
      raise
    end
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
