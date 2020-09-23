class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :day_hour
      t.integer :status
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
