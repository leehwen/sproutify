class Collection < ApplicationRecord
  belongs_to :user
  has_many :plants, dependent: :nullify

  has_one_attached :image

  validates :name, presence: true
end
