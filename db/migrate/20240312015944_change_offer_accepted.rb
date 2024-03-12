class ChangeOfferAccepted < ActiveRecord::Migration[7.1]
  def up
    change_table :offers do |t|
      t.change :accepted, :string
    end
  end

  def down
    change_table :offers do |t|
      t.change :accepted, :boolean
    end
  end
end
