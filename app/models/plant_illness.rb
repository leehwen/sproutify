class PlantIllness < ApplicationRecord
  belongs_to :illness
  belongs_to :plant
end
