class RenameLabelOlorColumnToSchedule < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedules, :label_olor, :label_color
  end
end
