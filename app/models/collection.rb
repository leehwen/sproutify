class Collection < ApplicationRecord
  belongs_to :user
  has_many :plants

  has_one_attached :image

  validates :name, presence: true
end
