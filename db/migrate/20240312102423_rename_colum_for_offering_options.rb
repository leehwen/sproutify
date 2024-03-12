class RenameColumForOfferingOptions < ActiveRecord::Migration[7.1]
  def change
    rename_column(:offering_options, :offering_plant_option_id, :plant_id)
  end
end
