class CreateIllnesses < ActiveRecord::Migration[7.1]
  def change
    create_table :illnesses do |t|
      t.string :name
      t.string :cause
      t.text :description
      t.text :treatment
      t.string :common_names

      t.timestamps
    end
  end
end
