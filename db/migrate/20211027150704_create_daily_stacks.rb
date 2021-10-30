class CreateDailyStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_stacks do |t|
      t.string :title, null: false
      t.integer :amount
      t.integer :status, null: false, default: 0
      t.date :date, null: false
      t.integer :unit, null: false
      t.references :expense_category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
