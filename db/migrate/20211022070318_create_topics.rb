class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.text :content, null: false
      t.string :month
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
