class Offer < ApplicationRecord
  belongs_to :lister_plant, class_name: 'Plant', foreign_key: 'lister_plant_id', required: true
  belongs_to :buyer_plant, class_name: 'Plant', foreign_key: 'buyer_plant_id', optional: true
  belongs_to :lister, class_name: 'User', foreign_key: 'lister_id', required: true
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', required: true

  has_many :offering_options

  STATUSES = %w[pending accepted rejected].freeze

  validates :accepted, inclusion: { in: STATUSES }, presence: true
end
