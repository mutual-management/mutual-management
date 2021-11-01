class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :content, null: false
      t.date :month
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
