class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: :true
  belongs_to :plant_info
  has_one_attached :image

  has_many :plant_illnesses
  has_many :illnesses, through: :plant_illnesses

  has_many :offers
  has_many :offering_options

end
