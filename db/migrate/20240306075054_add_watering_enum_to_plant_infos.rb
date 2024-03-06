class AddWateringEnumToPlantInfos < ActiveRecord::Migration[7.1]
  def change
    create_enum :watering_levels, ["undefined", "dry", "medium", "wet"]
    add_column :plant_infos, :watering, :enum, enum_type: :watering_levels, default: "undefined", null: false
  end
end
