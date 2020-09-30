class Department < ApplicationRecord
  has_many :schedules

  validates :name, presence: true
end
