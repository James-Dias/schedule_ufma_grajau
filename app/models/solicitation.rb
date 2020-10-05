class Solicitation < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :schedule_id, uniqueness: { scope: :user_id, message: "Você já solicitou esse horário!"}
end
