class ChangeColumnExpenseCategoryIdToDailyStacks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :daily_stacks, :expense_category_id, true
  end
end
