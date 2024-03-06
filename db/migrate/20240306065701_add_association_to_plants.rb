class AddAssociationToPlants < ActiveRecord::Migration[7.1]
  def change
    add_reference :plants, :plant_info, foreign_key: true, null: false
  end
end
