class AddUserIdToBuddies < ActiveRecord::Migration[7.1]
  def change
    add_reference :buddies, :user, foreign_key: true
  end
end
