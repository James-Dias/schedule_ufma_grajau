class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.administrator?
        scope.all
      else
        scope.where(id: user)
      end
    end
  end

  def index?
    user.administrator?
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
