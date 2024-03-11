class PlantPolicy < ApplicationPolicy

  def show?
    record.user == user
  end

  def add_diagnosis?
    record.user == user
  end

  def remove_diagnosis?
    record.user == user
  end

  def listings?
    true
  end

  def listing?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end
end
