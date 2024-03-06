class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :nickname
      t.boolean :listing
      t.text :remarks

      t.timestamps
    end
  end
end
