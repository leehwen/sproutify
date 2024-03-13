class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: true
  belongs_to :plant_info
  has_one_attached :image

  has_many :plant_illnesses
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

  def schedule(given_date = nil)
    # find the start date
    # params[:start_date]
    # calculate schedule based on frequency
    return [] if watering_frequency.nil?
    return [] if start_date.nil?

    if given_date.nil? || Date.parse(given_date).beginning_of_month == start_date.beginning_of_month
      dates = []
      instances = 120 / watering_frequency
      instances.times do |index|
        dates << OpenStruct.new(
          nickname:,
          watering_date: start_date + (index * watering_frequency).days
        )
      end
      dates

    elsif Date.parse(given_date).beginning_of_month < start_date.beginning_of_month
      []
    else
      calendar_start_date = Date.parse(given_date).beginning_of_month

      dates = []
      # find start date
      # find no of days
      difference = (calendar_start_date - start_date).abs
      # no of days / watering schedule => instances (rounded)
      offset = ((difference / watering_frequency).ceil * watering_frequency) - difference
      instances = 60 / watering_frequency


      instances.times do |index|
        dates << OpenStruct.new(
          nickname:,
          watering_date: (calendar_start_date + offset) + (index * watering_frequency).days
        )
      end
      dates
    end



  end

end
