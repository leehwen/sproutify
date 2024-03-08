class PlantPolicy < ApplicationPolicy


  def show?
    record.user == user
  end

  def add_diagnosis?
    record.user == user
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
