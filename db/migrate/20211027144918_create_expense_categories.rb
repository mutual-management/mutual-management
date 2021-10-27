class CreateExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories do |t|
      t.string :title, null: false
      t.boolean :delete_flag, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
