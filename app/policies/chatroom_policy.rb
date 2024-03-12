class ChatroomPolicy < ApplicationPolicy

  def show?
    true # to update policy as below
    # record.participants.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
