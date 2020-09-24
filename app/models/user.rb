class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable#, :recoverable

  before_validation :unmask_cpf
  validates :cpf, presence: true
  validates :cpf, uniqueness: true
  validates_cpf :cpf

  has_many :schedules

  enum kind: {student: 0, functionary: 1, administrator: 2}

  private
    # Remove mask from CPF
    def unmask_cpf
      unless cpf.blank? then cpf.gsub!(/[.-]/,'') end
    end
end
