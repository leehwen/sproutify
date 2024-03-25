class CollectionPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def add_plant?
    record.user == user
  end

  def update?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user).order("created_at DESC")
    end
  end
end
