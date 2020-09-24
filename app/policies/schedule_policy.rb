class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.administrator?
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    false
  end
end
