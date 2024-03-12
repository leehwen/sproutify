class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :participants
  belongs_to :offer
end
