class AddAssociationsToPlants < ActiveRecord::Migration[7.1]
  def change
    add_reference :plants, :user, foreign_key: true, null: false
    add_reference :plants, :collection, foreign_key: true
  end
end
