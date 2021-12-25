class AddColumnsToSchedules < ActiveRecord::Migration[6.0]
  def change
    change_column_null :schedules, :title, false
    change_column_null :schedules, :date, false
    change_column_null :schedules, :time, false
  end
end
