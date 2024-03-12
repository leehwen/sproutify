class AddStartdateToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :start_date, :date
  end
end
