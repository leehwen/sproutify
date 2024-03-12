class ChangeBuyerPlantId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :offers, :buyer_plant_id, true
  end
end
