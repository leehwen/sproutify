class BuddyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

  end

  def show?
    record.user == user
  end

  def send_schedule?
    record.user == user
  end

end
