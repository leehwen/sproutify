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

  def update_listing?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def offering_option?
    record.user == user
  end

  def edit_schedule?
    record.user == user
  end

  def update_schedule?
    record.user == user
  end

  def share?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user).order("created_at DESC")
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
