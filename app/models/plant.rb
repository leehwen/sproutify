class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: :true
  belongs_to :plant_info
  has_one_attached :image

  has_many :plant_illnesses
  has_many :illnesses, through: :plant_illnesses

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      plant_info: [ :name, :common_names ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
