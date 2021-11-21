class ChangeColumnDeleteFlagToExpenseCategories < ActiveRecord::Migration[6.0]
  def change
    change_column_null :expense_categories, :delete_flag, true
  end
end
