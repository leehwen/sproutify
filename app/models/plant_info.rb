class PlantInfo < ApplicationRecord
  has_many :plants, dependent: :destroy

  validates :name, presence: true
end
