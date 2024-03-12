class OfferingOption < ApplicationRecord
  belongs_to :offer
  belongs_to :plant
  belongs_to :offering_plant_option, class_name: 'Plant', foreign_key: 'offering_plant_option_id', required: true
end
