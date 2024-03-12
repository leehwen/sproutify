class MessagePolicy < ApplicationPolicy
  def create?
    record.offer.lister == user || record.offer.buyer == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
