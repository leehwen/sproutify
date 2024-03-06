class AddColumnToIllnesses < ActiveRecord::Migration[7.1]
  def change
    add_column :illnesses, :image_url, :string
  end
end
