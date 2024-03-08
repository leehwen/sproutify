class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.boolean :accepted
      t.references :lister_plant, null: false, foreign_key: {to_table: :plants}
      t.references :buyer_plant, null: false, foreign_key: {to_table: :plants}
      t.references :lister, null: false, foreign_key: {to_table: :users}
      t.references :buyer, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
