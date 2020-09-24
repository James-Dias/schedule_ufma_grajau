class AddRequesterToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :requester, :integer
  end
end
