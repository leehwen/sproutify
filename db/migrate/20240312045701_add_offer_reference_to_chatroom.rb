class AddOfferReferenceToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :offer, foreign_key: true, null: false
  end
end
