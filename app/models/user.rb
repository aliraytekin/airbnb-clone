class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_offers, through: :favorites, source: :offer
  has_one_attached :avatar
end
