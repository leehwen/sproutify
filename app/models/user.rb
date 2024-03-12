class User < ApplicationRecord
  has_many :plants
  has_many :collections

  has_one_attached :image
  has_many :plants, dependent: :destroy

  has_many :chatrooms, through: :participants
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :first_name, :last_name, :address, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
