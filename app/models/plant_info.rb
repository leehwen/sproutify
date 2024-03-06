class PlantInfo < ApplicationRecord
  has_many :plants, dependent: :destroy
end
