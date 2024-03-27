class Message < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :content, length: { minimum: 1, too_short: "1 character is the minimum" }
end
