class CreateOfferingOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :offering_options do |t|
      t.references :offer, foreign_key: true, null: false
      t.references :offering_plant_option, null: false, foreign_key: {to_table: :plants}
      t.timestamps
    end
  end
end
