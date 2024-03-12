class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: :true
  belongs_to :plant_info
  has_one_attached :image

  has_many :plant_illnesses
  has_many :illnesses, through: :plant_illnesses

  def schedule()
    # find the start date
    # calculate schedule based on frequency
    return [] if watering_frequency.nil?

    dates = []
    # find start date
    # find no of days
    # no of days / watering schedule => instances (rounded)
    instances.times do |index|
      dates << OpenStruct.new(
        nickname:,
        watering_date: updated_at + (index * watering_frequency).days
      )
    end
    dates
  end
end
