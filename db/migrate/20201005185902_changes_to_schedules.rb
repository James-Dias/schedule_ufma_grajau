class ChangesToSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :day_hour, :datetime
    add_column :schedules, :day, :date
    add_column :schedules, :hour_begin, :time
    add_column :schedules, :hour_end, :time
  end
end
