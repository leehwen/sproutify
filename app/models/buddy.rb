class Buddy < ApplicationRecord
  belongs_to :user
  
  validates :name, :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not in a valid format"
end