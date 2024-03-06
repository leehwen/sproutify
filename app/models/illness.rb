class Illness < ApplicationRecord
  has_many :plant_illnesses

  validates :name, presence: true
end
