class PlantInfo < ApplicationRecord
  enum watering: [:undefined, :dry, :medium, :wet]
  has_many :plants, dependent: :destroy

  validates :name, presence: true
end
