class Solicitation < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :schedule_id, uniqueness: { scope: :user_id, message: "Você já solicitou esse horário!"}

  scope :day_already_requested, lambda {|schedule, user|
    joins(:schedule).where(schedule: schedule, user_id: user, 'schedules.day': schedule.day)
  }

  scope :create_solicitation, lambda {|schedule, user|
    create(schedule: schedule, user_id: user)
  }


  scope :scope_name, -> { Solicitation.joins(:schedule)
    .where(schedule_id: @schedule.id, user_id:current_user.id, 'schedules.day': @schedule.day).blank?}
end
