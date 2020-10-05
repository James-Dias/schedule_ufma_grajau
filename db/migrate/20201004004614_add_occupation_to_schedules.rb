class AddOccupationToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :occupation, :integer, default: 0
  end
end
