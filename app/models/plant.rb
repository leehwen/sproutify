class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: :true
  belongs_to :plant_info

  has_many :plant_illnesses
  has_many :illnesses, through: :plant_illnesses
end
