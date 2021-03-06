class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.administrator?
        scope.all
      elsif user.functionary?
        scope.where(user: user)
      end
    end
  end

  def index?
    user.administrator? or user.functionary?
  end

  def multiple_schedules?
    user.administrator? or user.functionary?
  end

  def available_schedules?
    true
  end

  def solicitation_schedules?
    true
  end

  def my_solicitations?
    true
  end

  def inativation_schedules?
    user.administrator? or user.functionary?
  end

  def show?
    user.administrator? or user.functionary?
  end

  def create?
    user.administrator? or user.functionary?
  end

  def new?
    create?
  end

  def update?
    user.administrator? or user.functionary?
  end

  def edit?
    user.administrator? or user.functionary?
  end

  def destroy?
    false
  end
end
