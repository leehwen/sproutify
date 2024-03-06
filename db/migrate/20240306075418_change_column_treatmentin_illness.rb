class ChangeColumnTreatmentinIllness < ActiveRecord::Migration[7.1]
  def change
    change_column :illnesses, :treatment, :jsonb, using: 'treatment::jsonb'
  end
end
