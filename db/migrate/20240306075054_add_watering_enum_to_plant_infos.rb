class AddWateringEnumToPlantInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :plant_infos, :watering, :integer
  end
end
