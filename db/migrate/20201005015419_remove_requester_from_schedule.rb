class RemoveRequesterFromSchedule < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :requester, :integer
  end
end
