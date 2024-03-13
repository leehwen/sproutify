class PlantInfo < ApplicationRecord
  enum watering: [:undefined, :dry, :medium, :wet]
  has_many :plants, dependent: :nullify

  validates :name, presence: true
end
