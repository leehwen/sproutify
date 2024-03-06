class PlantInfo < ApplicationRecord
  has_many :plants

  validates :name, presence: true
end
