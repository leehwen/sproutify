class CreateBuddies < ActiveRecord::Migration[7.1]
  def change
    create_table :buddies do |t|
      t.string :email
      t.string :hp
      t.string :name

      t.timestamps
    end
  end
end
