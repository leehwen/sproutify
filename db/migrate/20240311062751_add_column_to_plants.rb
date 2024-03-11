class AddColumnToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :watering_frequency, :integer
  end
end
