class UpdateDefaultToPlantListings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :plants, :listing, from: nil, to: false
  end
end
