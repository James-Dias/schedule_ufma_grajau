class DepartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.administrator?
  end

  def show?
    user.administrator?
  end

  def create?
    user.administrator?
  end

  def new?
    create?
  end

  def update?
    user.administrator?
  end

  def edit?
    user.administrator?
  end

  def destroy?
    false
  end
end
