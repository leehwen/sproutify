class CreatePlantInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :plant_infos do |t|
      t.string :name
      t.string :common_names
      t.text :description
      t.integer :watering
      t.string :propagation
      t.string :image_url
      t.timestamps
    end
  end
end
