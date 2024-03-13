class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: true
  belongs_to :plant_info, optional: true
  has_one_attached :image

  has_many :plant_illnesses, dependent: :nullify
  has_many :illnesses, through: :plant_illnesses

  has_many :offers
  has_many :offering_options

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      plant_info: [ :name, :common_names ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def schedule
    # find the start date
    # params[:start_date]
    # calculate schedule based on frequency
    return [] if watering_frequency.nil?
    return [] if start_date.nil?

    dates = []
    # find start date
    # find no of days
    # no of days / watering schedule => instances (rounded)
    instances = 30 / watering_frequency
    instances.times do |index|
      dates << OpenStruct.new(
        nickname:,
        watering_date: start_date + (index * watering_frequency).days
      )
    end
    dates
  end

end
