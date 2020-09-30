class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :department

  enum status: [:opened, :requested, :confirmed, :inactivated]

  validates :day_hour, presence: true

end
