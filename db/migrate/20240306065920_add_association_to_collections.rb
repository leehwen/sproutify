class AddAssociationToCollections < ActiveRecord::Migration[7.1]
  def change
    add_reference :collections, :user, foreign_key: true, null: false
  end
end
