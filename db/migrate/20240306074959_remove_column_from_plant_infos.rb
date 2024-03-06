class RemoveColumnFromPlantInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :plant_infos, :watering
  end
end
