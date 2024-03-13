class User < ApplicationRecord
  has_many :plants
  has_many :collections
  has_many :buddies
  has_many :messages


  has_one_attached :image
  has_many :plants, dependent: :destroy
  has_many :offers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :first_name, :last_name, :address, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true


  after_create :set_token

  private

  def set_token
    self.update(token:  SecureRandom.alphanumeric(32))
  end
end
