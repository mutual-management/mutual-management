class CreateMonthlyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_targets do |t|
      t.string :title, null: false
      t.integer :amount, null: false
      t.date :month, null: false
      t.integer :unit, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
