class AddSpacesToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :spaces, :integer
  end
end
