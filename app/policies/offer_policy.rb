class OfferPolicy < ApplicationPolicy
  def create?
    record.buyer_id == user.id
  end

  def show?
    record.lister == user || record.buyer == user
  end

  def new?
    true
  end

  def accept?
    record.lister == user
  end

  def reject?
    record.lister == user
  end

  class Scope < Scope

    def resolve
      scope.where(buyer: user).or(scope.where(lister: user))
    end
  end
end
