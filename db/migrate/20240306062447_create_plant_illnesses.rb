class CreatePlantIllnesses < ActiveRecord::Migration[7.1]
  def change
    create_table :plant_illnesses do |t|
      t.references :illness, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
