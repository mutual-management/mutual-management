class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :date
      t.time :time
      t.integer :label_olor

      t.timestamps
    end
  end
end
