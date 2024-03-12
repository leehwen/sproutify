class OfferPolicy < ApplicationPolicy
  def create?
    record.buyer_id == user.id
  end
end
