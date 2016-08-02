class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :reservation_bottles
  has_many :bottles, through: :reservation_bottles


end
